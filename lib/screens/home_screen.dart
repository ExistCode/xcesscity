import 'package:flutter/material.dart';
import 'package:xcesscity/models/colors.dart';

import '../navigation.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

BottomNavigationBar get navigationBar {
  return NavigationState.globalKey.currentWidget as BottomNavigationBar;
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
              Container(
              width: 200, 
              height: 200, 
              color: black,
              
              )],
            )));
  }
}
