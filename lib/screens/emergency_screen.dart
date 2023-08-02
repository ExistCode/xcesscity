import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:xcesscity/models/crime_updates.dart';
import 'package:xcesscity/screens/create_new_forum.dart';
import 'package:xcesscity/screens/detection_screen.dart';
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
                    right: 16,
                    bottom: 60,
                    top: MediaQuery.of(context).padding.top + 20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          child: Container(
                            child: Row(children: [
                              Icon(
                                Icons.pin_drop,
                                size: 18,
                                color: custom_colors.secondary,
                              ),
                              /*GestureDetector(
                                onTap: () {
                                  _getCurrentLocation().then((value) {
                                    lat = '${value.latitude}';
                                    long = '${value.longitude}';
                                    print('Latitude: $lat , Longitude: $long');
                                  });
                                  _liveLocation();
                                },*/
                              Text(
                                'ADJUST LOCATION',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: custom_colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () => Navigator.of(context)
                              .pushNamed(rulesPolicy.routeName),
                          child: Container(
                            child: Row(children: [
                              Icon(
                                Icons.flag,
                                size: 18,
                                color: Colors.red,
                              ),
                              Text(
                                'RULES & POLICY',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: custom_colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                          ),
                        )
                      ],
                    ),
                    //MAP WIDGET//
                    Container(
                      height: 310,
                      width: double.infinity,
                      padding: EdgeInsets.only(
                        top: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: MapSample(),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Incident Alert",
                      style: TextStyle(
                          color: custom_colors.primaryOrange,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 20),
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
                    GestureDetector(
                      onTap: () => Navigator.of(context)
                          .pushNamed(DetectionScreen.routeName),
                      child: Container(
                        width: 350,
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

/*void _liveLocation() {
  LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
  );

  Geolocator.getPositionStream(locationSettings: locationSettings)
      .listen((Position position) {
    lat = position.latitude.toString();
    long = position.longitude.toString();
    print('Latitude:$lat , Longitude:$long');
  });
}*/
