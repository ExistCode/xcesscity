import 'package:flutter/material.dart';
import 'package:xcesscity/models/colors.dart' as custom_colors;

class eventsCard extends StatefulWidget {
  const eventsCard({super.key});

  @override
  State<eventsCard> createState() => _eventsCardState();
}

class _eventsCardState extends State<eventsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(12),
        width: 152,
        height: 210,
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
            Container(
              alignment: Alignment.center,
              width: 68,
              height: 18,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Text(
                // Change the real date
                "Date",
                style: TextStyle(
                    color: custom_colors.accentOrange,
                    fontWeight: FontWeight.w600,
                    fontSize: 12),
              ),
            ),
            Spacer(),
            Text(
              // Change to the title
              "Antenatal Class",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.white),
            )
          ],
        ));
  }
}


    //     padding: EdgeInsets.all(10),
    //     width: 152,
    //     height: 192,
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.all(Radius.circular(12)),
    //       image: DecorationImage(
    //           image: AssetImage("lib/assets/images/image_9.png"),
    //           opacity: 0.7,
    //           fit: BoxFit.cover),
    //       boxShadow: [
    //         BoxShadow(
    //           color: custom_colors.secondary.withOpacity(1),
    //           spreadRadius: 2,
    //           blurRadius: 2,
    //           offset: const Offset(0, 2),
    //         ),
    //       ],
    //     ));
