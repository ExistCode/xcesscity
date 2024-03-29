import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:xcesscity/models/colors.dart' as custom_colors;
import 'package:flutter_switch/flutter_switch.dart';
import 'package:xcesscity/screens/sign_up_screen.dart';

import '../auth.dart';
import '../models/colors.dart';
import '../navigation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routeName = './login';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String errorMessage = '';
  bool status = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          children: [
            Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(top: 75, left: 38),
                child: Text("LOG IN",
                    style: TextStyle(
                        color: custom_colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold))),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 40),
                padding: const EdgeInsets.all(33),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: custom_colors.secondary,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email ",
                        style: TextStyle(
                            color: custom_colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        textInputAction: TextInputAction.next,
                        controller: emailController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            filled: true,
                            contentPadding: const EdgeInsets.all(10),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.email_outlined),
                              color:
                                  custom_colors.primaryOrange.withOpacity(0.8),
                              onPressed: () {},
                            ),
                            hintText: "Email Address...",
                            fillColor: custom_colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Password ",
                        style: TextStyle(
                            color: custom_colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        textInputAction: TextInputAction.done,
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            filled: true,
                            contentPadding: const EdgeInsets.all(10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.remove_red_eye_outlined),
                              color:
                                  custom_colors.primaryOrange.withOpacity(0.8),
                              onPressed: () {},
                            ),
                            hintText: "Password...",
                            fillColor: custom_colors.white),
                      ),
                      const Expanded(child: SizedBox()),
                      Row(
                        children: [
                          Text(
                            "Remember Me",
                            style: TextStyle(
                                color: custom_colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          const Spacer(),
                          FlutterSwitch(
                            activeColor: primaryOrange,
                            inactiveColor: secondary,
                            width: 60.0,
                            height: 30.0,

                            toggleSize: 25.0,
                            value: status,
                            borderRadius: 30.0,
                            padding: 1.0,
                            // showOnOff: true,
                            onToggle: (val) {
                              setState(() {
                                status = val;
                              });
                            },
                          ),
                        ],
                      ),
                      Center(
                        child: _errorMessage(),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      GestureDetector(
                        onTap: signInWithEmailAndPassword,
                        child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                                color: primaryOrange,
                                borderRadius: BorderRadius.circular(20)),
                            alignment: Alignment.center,
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: custom_colors.white),
                            )

                            // Text(
                            //   "LOGIN",
                            //   style: (TextStyle(
                            //       fontWeight: FontWeight.bold,
                            //       color: white,
                            //       fontSize: 16)),
                            // ),
                            ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Reset Password",
                          style: (TextStyle(
                            fontWeight: FontWeight.w400,
                            color: white,
                            fontSize: 15,
                            decoration: TextDecoration.underline,
                          )),
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      Center(
                        child: Text(
                          " OR",
                          style: (TextStyle(
                            color: white,
                          )),
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: const SweepGradient(
                                    colors: [
                                      Color.fromRGBO(246, 0, 0, 1),
                                      Color.fromRGBO(255, 215, 83, 1),
                                      Color.fromRGBO(52, 168, 83, 1),
                                      Color.fromRGBO(3, 192, 252, 1)
                                    ],
                                    tileMode: TileMode.mirror,
                                  )),
                              child: GestureDetector(
                                onTap: () => Auth().signInWithGoogle(),
                                child: Container(
                                  width: double.infinity,
                                  height: 40,
                                  margin: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 40.0,
                                          width: 40.0,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "lib/assets/images/googleicon.png"),
                                                fit: BoxFit.cover),
                                            shape: BoxShape.circle,
                                            //color: white
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 50,
                                        ),
                                        const Text(
                                          "Sign In with Google",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                        )
                                      ]),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Don’t have an account? ",
                                  style: TextStyle(
                                      color: custom_colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () => Navigator.of(context)
                                      .pushNamed(SignUpScreen.routeName),
                                  child: Text(
                                    "SIGNUP",
                                    style: (TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: white,
                                      fontSize: 15,
                                      decoration: TextDecoration.underline,
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]), //Main column
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _errorMessage() {
    return Text(
      errorMessage == '' ? '' : 'Hmm? $errorMessage',
      textAlign: TextAlign.center,
      style: TextStyle(
          color: custom_colors.primaryOrange,
          fontSize: 14,
          fontWeight: FontWeight.w600),
    );
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth()
          .signInWithEmailAndPassword(
            emailController.text,
            passwordController.text,
          )
          .then(
              (value) => Navigator.of(context).pushNamed(Navigation.routeName));
    } on FirebaseAuthException catch (e) {
      setState(
        () {
          errorMessage = e.message!;
        },
      );
    }
  }
}
