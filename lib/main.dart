import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xcesscity/auth_widget_tree.dart';
import 'package:xcesscity/models/colors.dart';
import 'package:xcesscity/providers/forum_provider.dart';
import 'package:xcesscity/providers/location_provider.dart';
import 'package:xcesscity/providers/user_provider.dart';
import 'package:xcesscity/screens/community_detail_screen.dart';
import 'package:xcesscity/screens/create_new_forum.dart';
import 'package:xcesscity/screens/detection_screen.dart';
import 'package:xcesscity/screens/emergency_screen.dart';
import 'package:xcesscity/screens/event_screen.dart';
import 'package:xcesscity/screens/explore_screen.dart';
import 'package:xcesscity/screens/forum_screen.dart';
import 'package:xcesscity/screens/live_object_detection.dart';
import 'package:xcesscity/screens/login_screen.dart';

import 'package:xcesscity/screens/restaurant_screen.dart';
import 'package:xcesscity/screens/rulespolicy_screen.dart';
import 'package:xcesscity/screens/sign_up_screen.dart';

import 'package:xcesscity/screens/write_report_screen.dart';
import 'package:xcesscity/testing_screen.dart';
import 'package:xcesscity/screens/home_screen.dart';
import 'package:xcesscity/screens/question_screen.dart';
import 'package:xcesscity/screens/welcome_screen.dart';
import 'package:xcesscity/widgets/camera_view.dart';
import 'navigation.dart';
import 'screens/setting_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:xcesscity/firebase_options.dart';

List<CameraDescription>? cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  cameras = await availableCameras();

  runApp(const MyApp());
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
        ),
        ChangeNotifierProvider.value(value: LocationProvider()),
        ChangeNotifierProvider.value(value: ForumProvider())
      ],
      child: MaterialApp(
          title: 'XcessCITY',
          theme: ThemeData(
            fontFamily: 'Poppins',
            scaffoldBackgroundColor: backgroundBlack,
            primaryColor: white,
          ),
          home: AuthWidgetTree(),

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
            SignUpScreen.routeName: (context) => SignUpScreen(),
            TestingScreen.routeName: (context) => TestingScreen(),
            RulesPolicy.routeName: (context) => RulesPolicy(),
            CommunityDetailScreen.routeName: (context) =>
                CommunityDetailScreen(),
            CreateNewForum.routeName: (context) => CreateNewForum(),
            PotholeDetectionScreen.routeName: (context) =>
                PotholeDetectionScreen(),
            WriteReport.routeName: (context) => WriteReport(),
            RestaurantScreen.routeName: (context) => RestaurantScreen()
          }),
    );
  }
}
