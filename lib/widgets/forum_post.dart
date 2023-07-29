import 'package:flutter/material.dart';

import '../models/colors.dart';

class ForumPost extends StatelessWidget {
  const ForumPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF292642),
              Color(0xFF372637),
            ],
          )),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: accentOrange),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    style: TextStyle(color: white),
                  ),
                  Text(
                    "@UserName",
                    style: TextStyle(color: white),
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 10),
          Text(
            "Someone hit my car and ran at Taylor’s Nania, that guy driving 1920 Bugatti Chiron, plate number BNC8888, bad guy +1. Help me find him and be beat him up. 👊 👊 ",
            style: TextStyle(color: white),
          ),
          SizedBox(height:10),
          Row(
            children: [
              Icon(Icons.thumb_up_alt, color: white),
              SizedBox(width: 10),
              Icon(Icons.comment_rounded, color: white),
              SizedBox(width: 10),
              Icon(Icons.ios_share, color: white)
            ],
          )
        ],
      ),
    );
  }
}
