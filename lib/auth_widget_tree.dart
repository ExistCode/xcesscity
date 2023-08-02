import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xcesscity/providers/user_provider.dart';
import 'package:xcesscity/screens/explore_screen.dart';
import 'package:xcesscity/screens/home_screen.dart';
import 'package:xcesscity/screens/login_screen.dart';
import 'package:xcesscity/screens/welcome_screen.dart';
import 'package:xcesscity/testing_screen.dart';
import 'auth.dart';
import 'models/user_model.dart';
import 'navigation.dart';

class AuthWidgetTree extends StatefulWidget {
  const AuthWidgetTree({super.key});

  @override
  State<AuthWidgetTree> createState() => _AuthWidgetTreeState();
}

class _AuthWidgetTreeState extends State<AuthWidgetTree> {
  @override
  Widget build(BuildContext context) {
    UserModel currentUser =
        Provider.of<UserProvider>(context, listen: false).userProviderData;
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print("navigation");
          print(currentUser.name);
          return Navigation();
        } else {
          print('welcome');
          return WelcomeScreen();
        }
      },
    );
  }
}
