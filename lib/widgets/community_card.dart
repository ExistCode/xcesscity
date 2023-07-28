import 'package:flutter/material.dart';
import 'package:xcesscity/models/colors.dart' as custom_colors;

class communityCard extends StatefulWidget {
  const communityCard({super.key});

  @override
  State<communityCard> createState() => _communityCardState();
}

class _communityCardState extends State<communityCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 120,
      padding: EdgeInsets.only(right: 24, top: 12, left: 36, bottom: 16),
      decoration: BoxDecoration(
          color: custom_colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Align(
          alignment: Alignment.topRight,
          child: Text(
            "Distance",
            style: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
        Text(
          "Place",
          style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline,
              color: custom_colors.primaryOrange),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("numOfMem"), viewButton()],
        )
      ]),
    );
  }
}

class viewButton extends StatelessWidget {
  const viewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 23,
      decoration: BoxDecoration(
          color: custom_colors.secondary,
          borderRadius: BorderRadius.circular(8)),
      child: Center(
          child: Text(
        "View",
        style:
            TextStyle(fontWeight: FontWeight.w700, color: custom_colors.white),
      )),
    );
  }
}
