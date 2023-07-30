import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xcesscity/auth.dart';
import 'package:xcesscity/auth_widget_tree.dart';
import 'package:xcesscity/models/colors.dart';
import 'package:xcesscity/providers/user_provider.dart';
import 'package:xcesscity/screens/community_detail_screen.dart';
import 'package:xcesscity/screens/create_new_forum.dart';
import 'package:xcesscity/screens/detection_screen.dart';
import 'package:xcesscity/screens/emergency_screen.dart';
import 'package:xcesscity/screens/event_screen.dart';
import 'package:xcesscity/screens/explore_screen.dart';
import 'package:xcesscity/screens/forum_screen.dart';
import 'package:xcesscity/screens/login_screen.dart';
import 'package:xcesscity/screens/restaurant_screen.dart';
import 'package:xcesscity/screens/rulespolicy_screen.dart';
import 'package:xcesscity/screens/sign_up_screen.dart';
import 'package:xcesscity/screens/write_report_screen.dart';
import 'package:xcesscity/testing_screen.dart';
import 'package:xcesscity/screens/home_screen.dart';
import 'package:xcesscity/screens/question_screen.dart';
import 'package:xcesscity/screens/welcome_screen.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: UserProvider(),
        )
      ],
      child: MaterialApp(
          title: 'XcessCITY',
          theme: ThemeData(
            fontFamily: 'Poppins',
            scaffoldBackgroundColor: backgroundBlack,
            primaryColor: white,
          ),
          home: Navigation(),
          routes: {
            QuestionScreen.routeName: (context) => QuestionScreen(),
            SettingScreen.routeName: (context) => SettingScreen(),
            HomeScreen.routeName: (context) => HomeScreen(),
            EmergencyScreen.routeName: (context) => EmergencyScreen(),
            Navigation.routeName: (context) => Navigation(),
            ForumScreen.routeName: (context) => ForumScreen(),
            ExploreScreen.routeName: (context) => ExploreScreen(),
            EventScreen.routeName: (context) => EventScreen(),
            LoginScreen.routeName: (context) => LoginScreen(),
            signUpScreen.routeName: (context) => signUpScreen(),
            TestingScreen.routeName: (context) => TestingScreen(),
            rulesPolicy.routeName: (context) => rulesPolicy(),
            CommunityDetailScreen.routeName: (context) =>
                CommunityDetailScreen(),
            CreateNewForum.routeName: (context) => CreateNewForum(),
            DetectionScreen.routeName: (context) => DetectionScreen(),
            WriteReport.routeName: (context) => WriteReport()
          }),
    );
  }
}
