import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xcesscity/models/colors.dart';
import 'package:xcesscity/screens/setting_screen.dart';
import 'package:xcesscity/widgets/top_banner.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;
import '../models/user_model.dart';
import '../navigation.dart';
import '../providers/user_provider.dart';
import '../widgets/explore_main_card.dart';
import 'loading_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

BottomNavigationBar get navigationBar {
  return NavigationState.globalKey.currentWidget as BottomNavigationBar;
}

class _HomeScreenState extends State<HomeScreen> {
  // bool _isLoading = false;
  // @override
  // void initState() {
  //   var _userProvider =
  //       Provider.of<UserProvider>(context, listen: false).userProviderData;
  //   if (!_userProvider.name.isEmpty) {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    UserModel currentUser =
        Provider.of<UserProvider>(context, listen: false).userProviderData;

    return Scaffold(
      backgroundColor: Color(0xFF1A172F),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: () => {
                        Navigator.of(context)
                            .pushNamed(SettingScreen.routeName),
                      },
                  child: TopBanner(
                      300, "lib/assets/images/banner.png", 'Change Info')),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: accentOrange, shape: BoxShape.circle),
                            ),
                            SizedBox(
                              width: 56,
                            ),
                            Column(
                              children: [
                                Text(currentUser.name,
                                    style:
                                        TextStyle(color: white, fontSize: 28)),
                                Text(currentUser.userName,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 16))
                              ],
                            ),
                            Expanded(child: SizedBox())
                            // // Icon
                            // Container(
                            //   height: 98,
                            //   width: 85,
                            //   padding: EdgeInsets.symmetric(horizontal: 10),
                            //   decoration: BoxDecoration(
                            //       color: Color(0xFF4D5390).withOpacity(0.5),
                            //       borderRadius: BorderRadius.circular(20)),
                            //   child: Column(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       Row(children: [
                            //         Icon(Icons.thumb_up_alt,
                            //             color: accentOrange),
                            //         Spacer(),
                            //         Text("150",
                            //             style: TextStyle(color: Colors.white))
                            //       ]),
                            //       Row(children: [
                            //         Icon(Icons.star, color: accentOrange),
                            //         Spacer(),
                            //         Text("1.2k", style: TextStyle(color: white))
                            //       ]),
                            //       Row(children: [
                            //         Icon(Icons.remove_red_eye_sharp,
                            //             color: accentOrange),
                            //         Spacer(),
                            //         Text("528", style: TextStyle(color: white))
                            //       ]),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12),
                      Text("Latest News",
                          style: TextStyle(
                              color: white, fontWeight: FontWeight.w600)),
                      SizedBox(height: 8),
                      Image(image: AssetImage('lib/assets/images/news.png')),
                      SizedBox(height: 12),
                      Container(
                          child: Text("Announcements",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                          alignment: Alignment.centerLeft),
                      SizedBox(height: 12),
                      Container(
                        child: Image(
                            image: AssetImage(
                                'lib/assets/images/discountpromo.png')),
                      ),
                      const SizedBox(
                        height: 28,
                      )
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
