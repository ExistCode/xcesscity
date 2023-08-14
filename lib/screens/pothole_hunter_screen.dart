import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:xcesscity/widgets/pothole_map_card.dart';

import '../models/colors.dart';

class PotholeHunterScreen extends StatefulWidget {
  static const routeName = '/event';
  @override
  State<PotholeHunterScreen> createState() => _PotholeHunterScreenState();
}

class _PotholeHunterScreenState extends State<PotholeHunterScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 60,
            top: MediaQuery.of(context).padding.top + 20),
        width: double.infinity,
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              height: 100,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: primaryOrange,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(children: [
                Text("POTHOLE HUNTER",
                    style: TextStyle(
                        fontSize: 20,
                        color: white,
                        fontWeight: FontWeight.bold)),
                const SizedBox(width: 10),
                Icon(Icons.location_pin, color: white, size: 20)
              ]),
            ),
            const SizedBox(height: 20),
            Text("You have reported 520 potholes",
                style: TextStyle(
                    color: white, fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(height: 20),
            Container(
                //For the map, with markers
                width: double.infinity,
                height: 260,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  // border:Border.all(width: 1)
                ),
                child: PotholeMap()),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(Icons.brightness_5_outlined, color: secondary, size: 20),
                Text(
                  " : Existing Pothole",
                  style: TextStyle(
                      color: white,
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                ),
                const Spacer(),
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
            const SizedBox(height: 50),
            CircularPercentIndicator(
              radius: 60.0,
              lineWidth: 10.0,
              percent: 237.0 / 520,
              progressColor: accentOrange,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "237 / 520 Potholes Has Been fixed",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20, color: white),
            ),
          ],
        ),
      ),
    );
  }
}
