import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:xcesscity/models/colors.dart' as custom_colors;

class crimeUpdateCard extends StatelessWidget {
  String time;
  String updates;

  crimeUpdateCard({
    required this.time,
    required this.updates,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
          // Change to listview size
          height: 160,
          width: double.infinity,
          child: Row(children: [
            SizedBox(
              width: 8,
            ),
            // Circle
            Container(
              // height: 180,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: custom_colors.accentOrange,
                      boxShadow: [
                        BoxShadow(
                          color: custom_colors.backgroundBlack.withOpacity(0.1),
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
                      time,
                      style: TextStyle(
                          fontSize: 12, color: custom_colors.primaryOrange),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    AutoSizeText(
                      updates,
                      style: TextStyle(
                        color: custom_colors.white,
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
