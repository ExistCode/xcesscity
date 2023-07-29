import 'package:flutter/material.dart';
import 'package:xcesscity/models/colors.dart';
import 'package:xcesscity/screens/create_new_forum.dart';
import 'package:xcesscity/widgets/forum_top_bar.dart';

import '../widgets/forum_post.dart';

class ForumScreen extends StatefulWidget {
  static const routeName = '/forum';
  @override
  State<ForumScreen> createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(children: [
          Column(
            children: [
              ForumTopBar(),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                child: ForumPost(),
              )
            ],
          ),
          Positioned(
            bottom: 20,
            right: 25,
            child: GestureDetector(
                onTap: () =>
                    {Navigator.of(context).pushNamed(CreateNewForum.routeName)},
                child: Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: accentOrange),
                    child: Icon(Icons.add, color: white))),
          )
        ]),
      ),
    );
  }
}
