import 'package:flutter/material.dart';
import 'package:xcesscity/screens/emergency_screen.dart';
import 'package:xcesscity/screens/event_screen.dart';
import 'package:xcesscity/screens/explore_screen.dart';
import 'package:xcesscity/screens/forum_screen.dart';
import 'package:xcesscity/screens/home_screen.dart';
import './models/colors.dart' as custom_colors;
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
    EventScreen(),
  ];

  // @override
  // initState() {
  //   Provider.of<UserProvider>(context, listen: false).fetchUserData().then(
  //     (_) {
  //       setState(
  //         () {
  //           _isLoading = false;
  //         },
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    double NavBarIconSize = 32;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      
      // body: _isLoading ? LoadingScreen() : screens[currentIndex],
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        height: 90,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
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
            selectedItemColor: white,
            unselectedItemColor: custom_colors.white,
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
                  activeIcon: selectedBox( Icon(
                    Icons.home,
                    size: NavBarIconSize,
                  )),    
                  icon:  Icon(
                    Icons.home,
                    size: NavBarIconSize,
                  )),
              BottomNavigationBarItem(
                  label: '',
                  activeIcon: selectedBox(Icon(
                    Icons.explore,
                    size: NavBarIconSize)),
                  icon: Icon(
                    Icons.explore,
                    size: NavBarIconSize,
                  )),
               BottomNavigationBarItem(
                label: '',
                activeIcon: selectedBox(Icon(
                  Icons.shield_sharp,
                  size: 32,
                ),), 
                icon: Icon(
                  Icons.shield_sharp,
                  size: 32,
                ),
              ),
              BottomNavigationBarItem(
                  label: '',
                  activeIcon: selectedBox(Icon(
                    Icons.chat_bubble,
                    size: NavBarIconSize,
                  )),
                  icon: Icon(
                    Icons.chat_bubble,
                    size: NavBarIconSize,
                  )),
              BottomNavigationBarItem(
                label: '',
                activeIcon: selectedBox(Icon(
                  Icons.pin_drop,
                  size: NavBarIconSize,
                ),),
                icon: Icon(
                  Icons.pin_drop,
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

Widget selectedBox(icon) {
  return Container(
      decoration: BoxDecoration(
          color: accentOrange, borderRadius: BorderRadius.circular(15)),
      padding: EdgeInsets.all(10),
      child: icon);
}
