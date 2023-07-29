import 'package:flutter/material.dart';
import 'package:xcesscity/auth_widget_tree.dart';
import 'package:xcesscity/models/colors.dart';
import 'package:xcesscity/screens/community_detail_screen.dart';
import 'package:xcesscity/screens/create_new_forum.dart';
import 'package:xcesscity/screens/emergency_screen.dart';
import 'package:xcesscity/screens/event_screen.dart';
import 'package:xcesscity/screens/explore_screen.dart';
import 'package:xcesscity/screens/forum_screen.dart';
import 'package:xcesscity/screens/login_screen.dart';
import 'package:xcesscity/sign_up_screen.dart';
import 'package:xcesscity/testing_screen.dart';
import 'package:xcesscity/screens/home_screen.dart';
import 'package:xcesscity/screens/question_screen.dart';
import 'package:xcesscity/screens/welcome_screen.dart';
import 'navigation.dart';
import 'screens/setting_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:xcesscity/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'XcessCITY',
        theme: ThemeData(
          fontFamily: 'Poppins',
          scaffoldBackgroundColor: backgroundBlack,
          primaryColor: white,
        ),

        home: WelcomeScreen(),
        routes: {
          QuestionScreen.routeName: (context) => QuestionScreen(),
          SettingScreen.routeName: (context) => SettingScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          EmergencyScreen.routeName: (context) => EmergencyScreen(),
          Navigation.routeName: (context) => Navigation(),
          ForumScreen.routeName: (context) => ForumScreen(),
          CreateNewForum.routeName: (context) => CreateNewForum(),
          ExploreScreen.routeName: (context) => ExploreScreen(),
          EventScreen.routeName: (context) => EventScreen(),
          TestingScreen.routeName: (context) => TestingScreen(),
          LoginScreen.routeName: (context) => LoginScreen(),
          CommunityDetailScreen.routeName: (context) => CommunityDetailScreen()
        });
  }
}
