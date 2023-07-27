import 'package:flutter/material.dart';
import 'package:xcesscity/widgets/event_card.dart';

class EventScreen extends StatefulWidget {
  static const routeName = '/event';
  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
          decoration: BoxDecoration(color: Colors.red),
          width: double.infinity,
          height: 312,
          padding: EdgeInsets.all(20),
          child: Stack(
            children: [eventsCard()],
          ),
        )
      ]),
    );
  }
}
