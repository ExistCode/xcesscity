import 'package:flutter/material.dart';
import 'package:xcesscity/models/colors.dart';
import 'package:xcesscity/widgets/explore_main_card.dart';

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
          padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 60,
                    top: MediaQuery.of(context).padding.top + 20),
      width: double.infinity,
      height: double.infinity,
      child: Column(children: [ExploreMainCard()]),
      
    ));
  }
}
