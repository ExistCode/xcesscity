import 'package:flutter/material.dart';
import 'package:xcesscity/models/colors.dart' as custom_colors;

class test123 extends StatelessWidget {
  const test123({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(36),
        height: double.infinity,
        child: Column(
          children: [
            Container(
              height: 300,
              width: 200,
              child: Row(children: [
                SizedBox(
                  width: 8,
                ),
                // Circle
                Container(
                  height: double.infinity,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: custom_colors.secondary,
                              boxShadow: [
                                BoxShadow(
                                  color: custom_colors.accentOrange
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
                            color: custom_colors.accentOrange,
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
                          "hjhjahja",
                          style: TextStyle(
                              fontSize: 12, color: custom_colors.white),
                        ),
                        Text(
                          "ggg",
                          style: TextStyle(
                              fontSize: 20, color: custom_colors.white),
                        )
                      ]),
                )
              ]),
            ),
          ],
        ));
  }
}
