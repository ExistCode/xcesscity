import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  static const routeName = '/explore';
  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
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