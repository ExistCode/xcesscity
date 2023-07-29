import 'package:flutter/material.dart';
import 'package:xcesscity/models/colors.dart';
import 'package:xcesscity/screens/emergency_screen.dart';
import 'package:xcesscity/screens/event_screen.dart';
import 'package:xcesscity/screens/explore_screen.dart';
import 'package:xcesscity/screens/forum_screen.dart';
import 'package:xcesscity/screens/rulespolicy_screen.dart';
import 'package:xcesscity/widgets/crime_map.dart';
import 'navigation.dart';
import 'screens/home_screen.dart';

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
        title: 'Flutter Demo',
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
          rulesPolicy.routeName: (context) => rulesPolicy()
        });
  }
}
