import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:xcesscity/models/colors.dart' as colors;
import 'package:flutter_switch/flutter_switch.dart';

import '../models/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routeName = './login';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool status = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(top: 75, left: 38),
                child: Text("LOG IN",
                    style: TextStyle(
                        color: colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold))),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 40),
                padding: const EdgeInsets.all(33),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: colors.secondary,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email ",
                        style: TextStyle(
                            color: colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            filled: true,
                            contentPadding: const EdgeInsets.all(10),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.email_outlined),
                              color: colors.primaryOrange.withOpacity(0.8),
                              onPressed: () {},
                            ),
                            hintText: "Email Address...",
                            fillColor: colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Password ",
                        style: TextStyle(
                            color: colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            filled: true,
                            contentPadding: const EdgeInsets.all(10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.remove_red_eye_outlined),
                              color: colors.primaryOrange.withOpacity(0.8),
                              onPressed: () {},
                            ),
                            hintText: "Password...",
                            fillColor: colors.white),
                      ),
                      Row(
                        children: [
                          Text(
                            "Remember Me",
                            style: TextStyle(
                                color: colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          ),
                          // ToggleSwitch(
                          //   totalSwitches: 2,
                          //   activeBgColor: [colors.accentOrange],
                          //   inactiveBgColor: backgroundBlack,
                          //   cornerRadius: 20,
                          //   minWidth: 32,
                          //   minHeight: 17,
                          // )
                          const SizedBox(
                            height: 50,
                          ),
                          const Spacer(),
                          FlutterSwitch(
                            activeColor: primaryOrange,
                            width: 60.0,
                            height: 30.0,
                            valueFontSize: 17.0,
                            toggleSize: 25.0,
                            value: status,
                            borderRadius: 30.0,
                            padding: 1.0,
                            showOnOff: true,
                            onToggle: (val) {
                              setState(() {
                                status = val;
                              });
                            },
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            color: primaryOrange,
                            borderRadius: BorderRadius.circular(20)),
                        alignment: Alignment.center,
                        child: Text(
                          "LOGIN",
                          style: (TextStyle(
                              fontWeight: FontWeight.bold,
                              color: white,
                              fontSize: 16)),
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
                      const SizedBox(height: 50),
                      Text(
                        " -------------------- OR --------------------",
                        style: (TextStyle(
                          color: white,
                        )),
                      ),
                      const SizedBox(height: 50),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: SweepGradient(
                                    colors: [
                                      Color.fromRGBO(246, 0, 0, 1),
                                      Color.fromRGBO(255, 215, 83, 1),
                                      Color.fromRGBO(52, 168, 83, 1),
                                      Color.fromRGBO(3, 192, 252, 1)
                                    ],
                                    tileMode: TileMode.mirror,
                                  )),
                              child: Container(
                                width: double.infinity,
                                height: 40,
                                margin: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 40.0,
                                        width: 40.0,
                                        decoration: BoxDecoration(
                                          image: const DecorationImage(
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
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: black),
                              child: Container(
                                width: double.infinity,
                                height: 40,
                                margin: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 5),
                                        height: 30.0,
                                        width: 30.0,
                                        decoration: BoxDecoration(
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  "lib/assets/images/appleicon.png"),
                                              fit: BoxFit.cover),
                                          shape: BoxShape.circle,
                                          //color: white
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 55,
                                      ),
                                      const Text(
                                        "Sign In with Apple",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      )
                                    ]),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Don’t have an account? ",
                                  style: TextStyle(
                                      color: colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                const Spacer(),
                                Text(
                                  "SIGNUP",
                                  style: (TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: white,
                                    fontSize: 15,
                                    decoration: TextDecoration.underline,
                                  )),
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
}
