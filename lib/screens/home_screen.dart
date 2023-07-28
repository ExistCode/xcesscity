import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;
import '../navigation.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

BottomNavigationBar get navigationBar {
  return NavigationState.globalKey.currentWidget as BottomNavigationBar;
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: custom_colors.backgroundBlack,
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 300,
            padding: EdgeInsets.only(bottom: 30),
            child: Stack(children: [
              Container(
                width: double.infinity,
                height: 270,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('lib/assets/images/image 3.png')),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 160,
                  height: 40,
                  decoration: BoxDecoration(
                      color: custom_colors.accentOrange,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Center(
                    child: Center(
                      child: Text(
                        'Edit Banner',
                        style:
                            TextStyle(color: custom_colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
          Container(
            padding: EdgeInsets.all(10),
            height: 200,
            width: 350,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black45.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(0, 10))
                ],
                color: Color(0xFFDEDEDE).withOpacity(0.12),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    child: Icon(
                      Icons.edit,
                      size: 25,
                      color: custom_colors.white,
                    ),
                    // onTap: () => _key.currentState!.openDrawer(),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: custom_colors.accentOrange),
                ),
                Center(
                  child: Text(
                    'Rex Lim',
                    style: TextStyle(
                        fontSize: 20,
                        color: custom_colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Text(
                    '@rexkllim',
                    style: TextStyle(
                        fontSize: 12,
                        color: custom_colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 540,
            padding: EdgeInsets.only(top: 27),
            child: Container(
              width: 350,
              height: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black45.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(0, 7))
                ],
                color: Color(0xFFDEDEDE).withOpacity(0.12),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
              child: Column(children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.person,
                        size: 25,
                        color: custom_colors.white,
                      ),
                    ),
                    Text(
                      'Gender',
                      style: TextStyle(
                        color: custom_colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Male',
                      style: TextStyle(
                          fontSize: 15,
                          color: custom_colors.white.withOpacity(0.5)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.lock,
                        size: 25,
                        color: custom_colors.white,
                      ),
                    ),
                    Text(
                      'Password',
                      style: TextStyle(
                        color: custom_colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'r......3',
                      style: TextStyle(
                          fontSize: 15,
                          color: custom_colors.white.withOpacity(0.5)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.credit_card,
                        size: 25,
                        color: custom_colors.white,
                      ),
                    ),
                    Text(
                      'Card Info',
                      style: TextStyle(
                        color: custom_colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Card ending ...073',
                      style: TextStyle(
                          fontSize: 15,
                          color: custom_colors.white.withOpacity(0.5)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.email,
                        size: 25,
                        color: custom_colors.white,
                      ),
                    ),
                    Text(
                      'Email',
                      style: TextStyle(
                        color: custom_colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'rexkl@gmail.com',
                      style: TextStyle(
                          fontSize: 15,
                          color: custom_colors.white.withOpacity(0.5)),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
