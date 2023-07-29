import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xcesscity/auth_widget_tree.dart';
import 'package:xcesscity/models/colors.dart';
import 'package:xcesscity/providers/user_provider.dart';
import 'package:xcesscity/screens/community_detail_screen.dart';
import 'package:xcesscity/screens/create_new_forum.dart';
import 'package:xcesscity/screens/emergency_screen.dart';
import 'package:xcesscity/screens/event_screen.dart';
import 'package:xcesscity/screens/explore_screen.dart';
import 'package:xcesscity/screens/forum_screen.dart';
import 'navigation.dart';
import 'screens/setting_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:xcesscity/firebase_options.dart';

void main() async {
  // Initialize Firebase before running the app
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(fontFamily: 'Poppins', primaryColor: Colors.amber),
        theme: ThemeData(
          fontFamily: 'Poppins',
          scaffoldBackgroundColor: backgroundBlack,
          primaryColor: white,
        ),
        home: Navigation(),
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          EmergencyScreen.routeName: (context) => EmergencyScreen(),
          Navigation.routeName: (context) => Navigation(),
          ForumScreen.routeName: (context) => ForumScreen(),
          ExploreScreen.routeName: (context) => ExploreScreen(),
          EventScreen.routeName: (context) => EventScreen(),
        });
  }
}
