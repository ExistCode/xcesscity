import 'package:flutter/material.dart';
import 'package:xcesscity/screens/community_detail_screen.dart';
import 'package:xcesscity/widgets/community_card.dart';
import 'package:xcesscity/widgets/event_card.dart';
import 'package:xcesscity/models/colors.dart' as custom_colors;

class EventScreen extends StatefulWidget {
  static const routeName = '/event';
  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          width: double.infinity,
          height: 312,
          child: Stack(
            children: [
              Container(
                  padding: EdgeInsets.only(left: 28, bottom: 40),
                  width: double.infinity,
                  height: 184,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          custom_colors.accentOrange.withOpacity(0.9),
                          Color(0xFFDD6240).withOpacity(0.88),
                          custom_colors.primaryOrange
                        ],
                      )),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "HAPPENINGS IN YOUR AREA",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 24,
                        )
                      ],
                    ),
                  )),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 360,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        eventsCard(
                          imageUrl: "lib/assets/images/image_9.png",
                          date: "30 July",
                          title: "Antenatal Class",
                        ),
                        SizedBox(
                          width: 36,
                        ),
                        eventsCard(
                          imageUrl: "lib/assets/images/Event2.png",
                          date: "20 Aug",
                          title: "World Heart Day",
                        ),
                      ]),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Row(
            children: [
              Text(
                "Communities",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Around you",
                style: TextStyle(
                    fontSize: 18,
                    color: custom_colors.accentOrange,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 24,
        ),
        // Change to Listview Builder later
        communityCard(
            distance: "Your community", numOfMem: 400, placeName: "USJ 1"),
        const SizedBox(height: 20),
        communityCard(
          distance: "2km away",
          numOfMem: 500,
          placeName: "PJS 8",
        ),
        const SizedBox(height: 20),
        communityCard(
          distance: "4km away",
          numOfMem: 600,
          placeName: "USJ 7",
        ),
        const SizedBox(height: 40),
      ]),
    );
  }
}
