import 'package:flutter/material.dart';

class EmergencyScreen extends StatefulWidget {
  static const routeName = '/emergency';
  @override
  State<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {
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