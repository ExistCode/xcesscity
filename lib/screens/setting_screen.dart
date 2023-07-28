import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;
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
        body: Container(
          width:double.infinity,
          height:double.infinity,
          child: Column(children: [
            TopBanner(300,'lib/assets/images/banner.png','Edit Banner'),
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
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height:30),
            Expanded(
              child: Container(
                width: 350,
                
                decoration: BoxDecoration(       
                  color: Color(0xFF34294B),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                ),
                child: Column(children: [
                  SettingCategory(Icons.person,'Gender','Male'),
                  SettingCategory(Icons.lock,'Password','r....3'),
                  SettingCategory(Icons.credit_card, 'Card Info', '...4372'),
                  SettingCategory(Icons.email, 'Email', 'rexlim@gmail.com'),        

                ]),
              ),
            ),
          ]),
        ));
  }
}
