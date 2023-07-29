import 'package:flutter/material.dart';
import 'package:xcesscity/models/colors.dart' as custom_colors;

class newsCommunityCard extends StatefulWidget {
  const newsCommunityCard({super.key});

  @override
  State<newsCommunityCard> createState() => _newsCommunityCardState();
}

class _newsCommunityCardState extends State<newsCommunityCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(12),
        width: 332,
        height: 172,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
                // change to images link from database
                image: AssetImage("lib/assets/images/image_9.png"),
                opacity: 0.4,
                fit: BoxFit.cover),
            boxShadow: [
              BoxShadow(
                color: custom_colors.secondary.withOpacity(0.9),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 2),
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Text(
              // Change to the title
              "Antenatal Class",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Colors.white),
            )
          ],
        ));
  }
}