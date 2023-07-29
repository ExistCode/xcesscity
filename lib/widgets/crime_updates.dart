import 'package:flutter/material.dart';
import 'package:xcesscity/models/crime_updates.dart';
import '../models/colors.dart' as custom_colors;

class crimeUpdateWidget extends StatelessWidget {
  final crimeUpdates crimeupdates;

  const crimeUpdateWidget({super.key, required this.crimeupdates});

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // Change to listview size
              height: 100,
              // width: 100,
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                SizedBox(
                  width: 2,
                ),
                // Circle
                Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: custom_colors.accentOrange,
                              boxShadow: [
                                BoxShadow(
                                  color: custom_colors.backgroundBlack
                                      .withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: const Offset(0, 2),
                                )
                              ]),
                        ),
                        // Line
                        Expanded(
                          child: Container(
                            width: 4,
                            color: custom_colors.backgroundBlack,
                          ),
                        )
                      ]),
                ),
                SizedBox(
                  width: 8,
                ),
                // Text
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          crimeupdates.time,
                          style: TextStyle(
                              fontSize: 12, color: custom_colors.primaryOrange),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: 310,
                          child: Text(
                            crimeupdates.updates,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 16,
                                color: custom_colors.white),
                          ),
                        )
                      ]),
                )
              ]),
            ),
          ],
        ));
  }
}
