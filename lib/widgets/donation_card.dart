import 'package:flutter/material.dart';
import 'package:xcesscity/models/colors.dart' as custom_colors;

class donationCard extends StatelessWidget {
  String imageUrl;
  String title;
  donationCard({required this.imageUrl, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        width: 152,
        height: 60,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imageUrl), opacity: 0.9, fit: BoxFit.cover)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Spacer(),
          Text(
            // Change to the title
            title,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12,
                color: custom_colors.white),
          )
        ]));
  }
}
