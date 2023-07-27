import 'package:flutter/material.dart';
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
                  height: 187,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'lib/assets/images/rectangle-bg-events.png'))),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "HAPPENINGS IN YOUR AREA",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
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
                        eventsCard(),
                        SizedBox(
                          width: 36,
                        ),
                        eventsCard(),
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
              )
            ],
          ),
        ),
        // Change to Listview Builder later
      ]),
    );
  }
}
