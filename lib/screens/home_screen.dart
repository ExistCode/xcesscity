import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xcesscity/models/colors.dart';
import 'package:xcesscity/screens/setting_screen.dart';
import 'package:xcesscity/widgets/top_banner.dart';

import '../models/user_model.dart';
import '../navigation.dart';
import '../providers/user_provider.dart';

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
  @override
  Widget build(BuildContext context) {
    UserModel currentUser =
        Provider.of<UserProvider>(context, listen: false).userProviderData;

    final bannerURL = currentUser.userBackgroundUrl;

    return Scaffold(
      backgroundColor: const Color(0xFF1A172F),
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
                      300,
                      const AssetImage('lib/assets/images/banner.png'),
                      'Change Info')),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                height: 80,
                                width: 80,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.account_circle_rounded,
                                    size: 80, color: Colors.grey)),
                            Column(
                              children: [
                                Text(currentUser.name,
                                    style:
                                        TextStyle(color: white, fontSize: 28)),
                                Text("@${currentUser.userName}",
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 16))
                              ],
                            ),
                            Container(
                              height: 98,
                              width: 85,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color:
                                      const Color(0xFF4D5390).withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(children: [
                                    Icon(Icons.thumb_up_alt,
                                        color: accentOrange),
                                    const Spacer(),
                                    const Text("150",
                                        style: TextStyle(color: Colors.white))
                                  ]),
                                  Row(children: [
                                    Icon(Icons.star, color: accentOrange),
                                    const Spacer(),
                                    Text("1.2k", style: TextStyle(color: white))
                                  ]),
                                  Row(children: [
                                    Icon(Icons.remove_red_eye_sharp,
                                        color: accentOrange),
                                    const Spacer(),
                                    Text("528", style: TextStyle(color: white))
                                  ]),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text("Latest News",
                          style: TextStyle(
                              color: white, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 8),
                      const Image(
                          image: AssetImage('lib/assets/images/news.png')),
                      const SizedBox(height: 12),
                      Container(
                          child: const Text("Announcements",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                          alignment: Alignment.centerLeft),
                      const SizedBox(height: 12),
                      Container(
                        child: const Image(
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
