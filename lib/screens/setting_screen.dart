import 'package:flutter/material.dart';
import 'package:xcesscity/screens/home_screen.dart';
import '../models/colors.dart' as custom_colors;
import '../models/colors.dart';
import '../navigation.dart';
import '../widgets/setting_category.dart';
import '../widgets/top_banner.dart';

class SettingScreen extends StatefulWidget {
  static const routeName = '/settings';
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.arrow_back_ios_new_outlined)),
          backgroundColor: custom_colors.backgroundBlack,
          title: Text(
            "Edit Profile",
            style: TextStyle(
                color: custom_colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(children: [
              TopBanner(300, AssetImage('lib/assets/images/banner.png'), 'Edit Banner'),
              Container(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                      height: 80,
                      width: 80,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: custom_colors.accentOrange),
                    ),
                    Text(
                      'Rex Lim',
                      style: TextStyle(
                          fontSize: 20,
                          color: custom_colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '@rexkllim',
                      style: TextStyle(
                          fontSize: 12,
                          color: custom_colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 28),
              Container(
                width: 350,
                decoration: BoxDecoration(
                  color: Color(0xFF34294B),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(children: [
                  SettingCategory(Icons.person, 'Gender', 'Male'),
                  SettingCategory(Icons.lock, 'Password', 'r....3'),
                  SettingCategory(Icons.credit_card, 'Card Info', '...4372'),
                  SettingCategory(Icons.email, 'Email', 'rexlim@gmail.com'),
                ]),
              ),
              SizedBox(
                height: 28,
              )
            ]),
          ),
        ));
  }
}
