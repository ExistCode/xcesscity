import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
        body: Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: double.infinity,
      child: Column(children: [
        SizedBox(
          height: 50,
        ),
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
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushNamed(rulesPolicy.routeName),
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
              ),
            ),
          ],
        ),
        //MAP WIDGET//
        Column(
          children: [
            Container(
              height: 315,
              width: double.infinity,
              padding: EdgeInsets.only(top: 8),
              child: Container(
                  child: MapSample(),
                  decoration: BoxDecoration(
                      color: custom_colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
            ),
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: 50,
          ),
          GestureDetector(
            child: Icon(
              Icons.pin_drop,
              size: 20,
              color: custom_colors.accentOrange,
            ),
          ),
          Text(
            'Incident Alert',
            style: TextStyle(
              fontSize: 18,
              color: custom_colors.white,
            ),
          ),
          Spacer(),
          GestureDetector(
            child: Icon(
              Icons.circle,
              size: 18,
              color: custom_colors.secondary,
            ),
          ),
          Text(
            'PotHole Alert',
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 18,
              color: custom_colors.white,
            ),
          ),
        ]),
        Container(
          height: 230,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: custom_colors.white.withOpacity(0.7),
          ),
          width: double.infinity,
          child: ListView.builder(
              itemCount: dummyList.length,
              itemBuilder: (context, index) {
                return crimeUpdateWidget(crimeupdates: dummyList[index]);
              }),
        ),
        Container(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 35,
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: custom_colors.accentOrange,
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
      ]),
    ));
  }
}
