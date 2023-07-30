import 'package:flutter/material.dart';

class EventScreen extends StatefulWidget {
  static const routeName = '/event';
  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
