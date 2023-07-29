import 'package:flutter/material.dart';
import 'package:xcesscity/models/colors.dart' as custom_colors;

class donationCard extends StatelessWidget {
  const donationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        width: 152,
        height: 60,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/assets/images/new-restaurant.jpg'),
                opacity: 0.7,
                fit: BoxFit.cover)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Spacer(),
          Text(
            // Change to the title
            "Antenatal Class",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12,
                color: custom_colors.white),
          )
        ]));
  }
}
