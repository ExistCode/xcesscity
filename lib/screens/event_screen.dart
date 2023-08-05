import 'package:flutter/material.dart';
import 'package:xcesscity/screens/community_detail_screen.dart';
import 'package:xcesscity/widgets/community_card.dart';
import 'package:xcesscity/widgets/event_card.dart';
import 'package:xcesscity/models/colors.dart' as custom_colors;

import '../models/colors.dart';

class EventScreen extends StatefulWidget {
  static const routeName = '/event';
  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.topCenter,
          width: double.infinity,
          height: 170,
          decoration: BoxDecoration(
              color: primaryOrange, borderRadius: BorderRadius.circular(20)),
        ),
        Container(
          padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 60,
              top: MediaQuery.of(context).padding.top + 20),
          width: double.infinity,
          child: Column(
            children: [
              Row(children: [
                Text("POTHOLE HUNTER",
                    style: TextStyle(
                        fontSize: 20,
                        color: white,
                        fontWeight: FontWeight.bold)),
                const SizedBox(width: 10),
                Icon(Icons.location_pin, color: white, size: 20)
              ]),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 137,
                padding: const EdgeInsets.only(
                    top: 10, left: 10, right: 10, bottom: 0),
                decoration: BoxDecoration(
                    color: black, borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Current Points: ",
                          style: TextStyle(
                              color: primaryOrange,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(height: 10),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          "1314 pts",
                          style: TextStyle(
                              color: primaryOrange,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(height: 8),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "Click to view your rewards",
                          style: TextStyle(
                              color: primaryOrange,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  children: [
                    Text(
                      "You have fixed ",
                      style: TextStyle(
                          color: white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "520",
                      style: TextStyle(
                          color: primaryOrange,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " potholes!!",
                      style: TextStyle(
                          color: white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                //For the map, with markers
                width: double.infinity,
                height: 260,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Image.asset(
                  "lib/assets/images/mockMaprewardPage.png",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.brightness_5_outlined, color: secondary, size: 20),
                  Text(
                    " : Existing Pothole",
                    style: TextStyle(
                        color: white,
                        fontSize: 15,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.home, color: primaryOrange, size: 20),
                  Text(
                    " : Material Supplier",
                    style: TextStyle(
                        color: white,
                        fontSize: 15,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.location_pin, color: white, size: 20),
                  Text(
                    " : Current Location",
                    style: TextStyle(
                        color: white,
                        fontSize: 15,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(children: [
                const SizedBox(width: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Select an Existing Pothole: ",
                    style: TextStyle(
                        color: white,
                        fontSize: 13,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ]),
              Container(
                width: double.infinity,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: primaryOrange,
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  "POTHOLE FILLED",
                  style: TextStyle(
                      color: white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  const SizedBox(width: 10),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Select an Material Supplier: ",
                      style: TextStyle(
                          color: white,
                          fontSize: 13,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: primaryOrange,
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  "REQUEST MATERIAL",
                  style: TextStyle(
                      color: white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
