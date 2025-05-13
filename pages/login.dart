import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/Widget/widget_support.dart';
import 'package:fooddelivery/pages/forgotpassword.dart';
import 'package:fooddelivery/pages/signup.dart';
import 'package:fooddelivery/pages/bottomnav.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = "", password = "";

  final TextEditingController useremailcontroller = TextEditingController();
  final TextEditingController userpasswordcontroller = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  /// Firebase ашиглан хэрэглэгч нэвтрэх
  Future<void> userLogin() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BottomNav()),
        );
      }
    } on FirebaseAuthException catch (e) {
      String message = "Нэвтрэхэд алдаа гарлаа";
      if (e.code == 'user-not-found') {
        message = 'Ийм имэйлтэй хэрэглэгч олдсонгүй';
      } else if (e.code == 'wrong-password') {
        message = 'Нууц үг буруу байна';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message, style: const TextStyle(fontSize: 16.0)),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Төхөөрөмжийн алдаа: ${e.toString()}"),
          backgroundColor: Colors.orange.shade100,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              // Ногоон Gradient Background
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF4CAF50), Color(0xFF388E3C)],
                  ),
                ),
              ),
              // Доорх цагаан хэсэг
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 3,
                ),
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
              ),
              // Login форм
              Container(
                margin: const EdgeInsets.only(
                  top: 60.0,
                  left: 20.0,
                  right: 20.0,
                ),
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        "images/logo.png",
                        width: MediaQuery.of(context).size.width / 2,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 50.0),
                    Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              const SizedBox(height: 30.0),
                              Text(
                                "Login",
                                style: AppWidget.HeadLineTextFieldStyle(),
                              ),
                              const SizedBox(height: 30.0),
                              TextFormField(
                                controller: useremailcontroller,
                                validator:
                                    (value) =>
                                        value == null || value.isEmpty
                                            ? 'Email хаягаа оруулна уу'
                                            : null,
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  hintStyle: AppWidget.semiBoldTextFieldStyle(),
                                  prefixIcon: const Icon(Icons.email_outlined),
                                ),
                              ),
                              const SizedBox(height: 30.0),
                              TextFormField(
                                controller: userpasswordcontroller,
                                obscureText: true,
                                validator:
                                    (value) =>
                                        value == null || value.isEmpty
                                            ? 'Нууц үгээ оруулна уу'
                                            : null,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: AppWidget.semiBoldTextFieldStyle(),
                                  prefixIcon: const Icon(
                                    Icons.password_outlined,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              GestureDetector(
                                onTap: () {
                                  if (_formkey.currentState!.validate()) {
                                    setState(() {
                                      email = useremailcontroller.text.trim();
                                      password =
                                          userpasswordcontroller.text.trim();
                                    });
                                    userLogin();
                                  }
                                },
                                child: Material(
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8,
                                    ),
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF4CAF50),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "LOGIN",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontFamily: "Poppins1",
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 70.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUp(),
                          ),
                        );
                      },
                      child: Text(
                        "Don't have an account? Sign up",
                        style: AppWidget.semiBoldTextFieldStyle(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
