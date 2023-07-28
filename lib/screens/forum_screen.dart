import 'package:flutter/material.dart';

class ForumScreen extends StatefulWidget {
  static const routeName = '/forum';
  @override
  State<ForumScreen> createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Container(
        width: double.infinity,
        height:double.infinity,
      )
    );
  }
}