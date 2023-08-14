import 'package:flutter/material.dart';

import '../models/colors.dart';

class ForumPost extends StatelessWidget {
  String authorName;
  String userName;
  String content;

  ForumPost(this.authorName, this.userName, this.content);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
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
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.account_circle_rounded,
                      size: 50, color: Colors.grey)),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    authorName,
                    style: TextStyle(color: white),
                  ),
                  Text(
                    "${userName}",
                    style: TextStyle(color: white),
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 10),
          Text(
            content,
            style: TextStyle(color: white),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Icon(Icons.thumb_up_alt, color: white),
              const SizedBox(width: 20),
              Icon(Icons.comment_rounded, color: white),
              const SizedBox(width: 20),
              Icon(Icons.ios_share, color: white)
            ],
          )
        ],
      ),
    );
  }
}
