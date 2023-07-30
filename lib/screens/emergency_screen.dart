import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:xcesscity/models/crime_updates.dart';
import 'package:xcesscity/screens/rulespolicy_screen.dart';
import 'package:xcesscity/widgets/crime_map.dart';
import 'package:xcesscity/widgets/crime_updates.dart';
import 'package:xcesscity/widgets/explore_row_category.dart';
import '../models/colors.dart' as custom_colors;
import '../navigation.dart';

import '../models/colors.dart';

class EmergencyScreen extends StatefulWidget {
  static const routeName = '/emergency';
  @override
  State<EmergencyScreen> createState() => _EmergencyScreenState();
}

BottomNavigationBar get navigationBar {
  return NavigationState.globalKey.currentWidget as BottomNavigationBar;
}

class _EmergencyScreenState extends State<EmergencyScreen> {
  @override
  Widget build(BuildContext context) {
    //Create dummylist first...//
    final dummyList = List.generate(3, (index) => crimeUdpatesModel.updates[0]);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          white.withOpacity(0.9),
                          custom_colors.primaryOrange,
                          accentOrange.withOpacity(0.88),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20))),
              Container(
                padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 60,
                    top: MediaQuery.of(context).padding.top + 20),
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          child: Icon(
                            Icons.pin_drop,
                            size: 18,
                            color: custom_colors.secondary,
                          ),
                        ),
                        Text(
                          'ADJUST LOCATION',
                          style: TextStyle(
                              fontSize: 12,
                              color: custom_colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () => Navigator.of(context)
                              .pushNamed(rulesPolicy.routeName),
                          child: Icon(
                            Icons.flag,
                            size: 18,
                            color: Colors.red,
                          ),
                        ),
                        Text(
                          'RULES & POLICY',
                          style: TextStyle(
                              fontSize: 12,
                              color: custom_colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    //MAP WIDGET//
                    Container(
                      height: 310,
                      width: double.infinity,
                      padding: EdgeInsets.only(top: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: MapSample(),
                    ),
                    SizedBox(height:20),
                    ToggleSwitch(
                      cornerRadius: 10,
                      minWidth: 150,
                      activeBgColor: [accentOrange],
                      activeFgColor: white,
                      inactiveBgColor: white,
                      inactiveFgColor: secondary,
                      customTextStyles: [TextStyle(fontWeight:FontWeight.bold)],
                      initialLabelIndex: 1,
                      totalSwitches: 2,
                      labels: ['Incident Alert', 'Pothole Alert'],
                      onToggle: (index) {                        
                      },
                      
                    ),
                    SizedBox(height:20),
                    // Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    //   SizedBox(
                    //     height: 50,
                    //   ),
                    //   GestureDetector(
                    //     child: Icon(
                    //       Icons.pin_drop,
                    //       size: 20,
                    //       color: custom_colors.accentOrange,
                    //     ),
                    //   ),
                    //   Text(
                    //     'Incident Alert',
                    //     style: TextStyle(
                    //       fontSize: 18,
                    //       color: custom_colors.white,
                    //     ),
                    //   ),
                    //   Spacer(),
                    //   GestureDetector(
                    //     child: Icon(
                    //       Icons.circle,
                    //       size: 18,
                    //       color: custom_colors.secondary,
                    //     ),
                    //   ),
                    //   Text(
                    //     'PotHole Alert',
                    //     style: TextStyle(
                    //       decoration: TextDecoration.underline,
                    //       fontSize: 18,
                    //       color: custom_colors.white,
                    //     ),
                    //   ),
                    // ]),
                    Container(
                      height: 230,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: secondary,
                      ),
                      width: double.infinity,
                      child: ListView.builder(
                          itemCount: dummyList.length,
                          itemBuilder: (context, index) {
                            return crimeUpdateWidget(
                                crimeupdates: dummyList[index]);
                          }),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 200,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: accentOrange),
                      child: Center(
                        child: Text(
                          "Report",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
