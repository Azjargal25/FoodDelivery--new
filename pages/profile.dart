import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/pages/login.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<Profile> {
  final User? user = FirebaseAuth.instance.currentUser;
  String balance = '...';

  @override
  void initState() {
    super.initState();
    _loadBalance();
  }

  Future<void> _loadBalance() async {
    if (user != null) {
      final doc =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user!.uid)
              .get();
      setState(() {
        balance = doc.data()?['balance'].toString() ?? '0';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final creationTime = user?.metadata.creationTime;

    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: const Text('Миний мэдээлэл'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.green[300],
              child: const Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 20),
            _infoTile("Нэр", user?.displayName ?? 'А.Азжаргал'),
            _infoTile("И-мэйл", user?.email ?? 'Тодорхойгүй'),
            _infoTile("Утасны дугаар", user?.phoneNumber ?? '98126099'),
            _infoTile(
              "Бүртгүүлсэн огноо",
              creationTime?.toLocal().toString().split(' ')[0] ?? '',
            ),
            _infoTile("Хэтэвчний үлдэгдэл", "$balance₮"),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
              icon: const Icon(Icons.logout),
              label: const Text("Гарах"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 12,
                ),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoTile(String title, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(title),
        subtitle: Text(value),
        leading: const Icon(Icons.info_outline),
      ),
    );
  }
}
