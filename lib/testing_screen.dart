import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xcesscity/models/colors.dart';

class TestingScreen extends StatefulWidget {
  const TestingScreen({super.key});
  static const routeName = '/test';
  @override
  State<TestingScreen> createState() => _TestingScreenState();
}

class _TestingScreenState extends State<TestingScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 50),
            TextField(
              style: TextStyle(color: Colors.white),
              controller: emailController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.white)),
            ),
            TextField(
              style: TextStyle(color: Colors.white),
              controller: passwordController,
              textInputAction: TextInputAction.done,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(color: white),
                  suffixIcon: Icon(Icons.lock)),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.amber),
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(50)),
                  icon: Icon(
                    Icons.lock_open,
                    size: 32,
                  ),
                  onPressed: signIn,
                  label: Text(
                    'Sign In',
                    style: TextStyle(fontSize: 24),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }
}
