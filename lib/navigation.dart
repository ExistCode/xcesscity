import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xcesscity/providers/user_provider.dart';
import 'package:xcesscity/screens/emergency_screen.dart';
import 'package:xcesscity/screens/pothole_hunter_screen.dart';
import 'package:xcesscity/screens/explore_screen.dart';
import 'package:xcesscity/screens/forum_screen.dart';
import 'package:xcesscity/screens/home_screen.dart';
import 'package:xcesscity/screens/loading_screen.dart';
import 'models/colors.dart';

class Navigation extends StatefulWidget {
  static const routeName = '/navigation';
  @override
  State<Navigation> createState() => NavigationState();
}

class NavigationState extends State<Navigation> {
  static GlobalKey<NavigationState> globalKey =
      new GlobalKey<NavigationState>();

  BottomNavigationBar get navigationBar {
    return NavigationState.globalKey.currentWidget as BottomNavigationBar;
  }

  int currentIndex = 0;
  bool _isLoading = true;

  List<Widget> screens = [
    HomeScreen(),
    ExploreScreen(),
    EmergencyScreen(),
    ForumScreen(),
    PotholeHunterScreen(),
  ];

  @override
  initState() {
    Provider.of<UserProvider>(context, listen: false).fetchUserData().then(
      (_) {
        setState(
          () {
            _isLoading = false;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double NavBarIconSize = 32;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundBlack,
      floatingActionButton: Container(
        height: 64,
        width: 64,
        child: FloatingActionButton(
          backgroundColor: currentIndex == 2 ? accentOrange : Color(0xFF433957),
          onPressed: () => navigationBar.onTap!(2),
          child: Icon(
            Icons.shield,
            size: NavBarIconSize,
            color: white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: _isLoading ? LoadingScreen() : screens[currentIndex],
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(28), topRight: Radius.circular(28)),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color(0xFF433957),
            selectedItemColor: accentOrange,
            unselectedItemColor: white,
            key: globalKey,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: currentIndex,
            onTap: (int newIndex) {
              setState(() {
                currentIndex = newIndex;
              });
            },
            items: [
              BottomNavigationBarItem(
                  label: '',
                  icon: Icon(
                    Icons.home_rounded,
                    size: NavBarIconSize,
                  )),
              BottomNavigationBarItem(
                  label: '',
                  icon: Icon(
                    Icons.explore,
                    size: NavBarIconSize,
                  )),
              const BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  Icons.shield,
                  size: 0,
                ),
              ),
              BottomNavigationBarItem(
                  label: '',
                  icon: Icon(
                    Icons.forum_rounded,
                    size: NavBarIconSize,
                  )),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  Icons.person_pin_circle_rounded,
                  size: NavBarIconSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
