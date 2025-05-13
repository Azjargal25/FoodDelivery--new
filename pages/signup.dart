import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/Widget/widget_support.dart';
import 'package:fooddelivery/pages/bottomnav.dart';
import 'package:fooddelivery/pages/login.dart';
//import 'package:supabase_flutter/supabase_flutter.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = "", password = "", name = "";

  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController mailcontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  Future<void> registration() async {
    try {
      // Firebase Authentication ашиглан хэрэглэгч бүртгэх
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // Firestore-д хэрэглэгчийн нэрийг хадгалах
      final user = userCredential.user;
      if (user != null) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'name': name,
          'email': email,
          'balance': 0, // initial wallet balance
        });

        // Тусгай мэдэгдэл харуулах
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              "Registered Successfully",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        );

        // Home page руу шилжих
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BottomNav()),
        );
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            e.message ?? "Unknown error",
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orange,
          content: Text(
            "Unexpected error occurred",
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF4CAF50),
                      Color(0xFF388E3C),
                    ], // ногоон өнгө
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 3,
                ),
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Text(""),
              ),
              Container(
                margin: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        "images/logo.png",
                        width: MediaQuery.of(context).size.width / 2,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 50.0),
                    Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 1.8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Form(
                          key: _formkey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 30.0),
                              Text(
                                "Sign Up",
                                style: AppWidget.HeadLineTextFieldStyle(),
                              ),
                              TextFormField(
                                controller: namecontroller,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Name';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Name',
                                  hintStyle: AppWidget.semiBoldTextFieldStyle(),
                                  prefixIcon: Icon(Icons.person_outlined),
                                ),
                              ),
                              SizedBox(height: 30.0),
                              TextFormField(
                                controller: mailcontroller,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter E-mail';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  hintStyle: AppWidget.semiBoldTextFieldStyle(),
                                  prefixIcon: Icon(Icons.email_outlined),
                                ),
                              ),
                              SizedBox(height: 30.0),
                              TextFormField(
                                controller: passwordcontroller,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter password';
                                  }
                                  return null;
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: AppWidget.semiBoldTextFieldStyle(),
                                  prefixIcon: Icon(Icons.password_outlined),
                                ),
                              ),
                              SizedBox(height: 80.0),
                              GestureDetector(
                                onTap: () {
                                  if (_formkey.currentState!.validate()) {
                                    setState(() {
                                      email = mailcontroller.text;
                                      name = namecontroller.text;
                                      password = passwordcontroller.text;
                                    });
                                    registration();
                                  }
                                },
                                child: Material(
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 8.0,
                                    ),
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: Color(0Xffff5722),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "SIGN UP",
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
                              SizedBox(height: 20.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 70.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      child: Text(
                        "Already have an account? Login",
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
