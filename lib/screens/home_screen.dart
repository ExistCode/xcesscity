import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;
import '../navigation.dart';
import '../widgets/explore_main_card.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

BottomNavigationBar get navigationBar {
  return NavigationState.globalKey.currentWidget as BottomNavigationBar;
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 60,
          top: MediaQuery.of(context).padding.top + 20),
      width: double.infinity,
      height: double.infinity,
      child: Column(children: [ExploreMainCard(), Text(user.email!)]),
    ));
  }
}
