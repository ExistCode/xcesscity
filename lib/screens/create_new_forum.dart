import 'package:flutter/material.dart';

import '../models/colors.dart';

class CreateNewForum extends StatefulWidget {
  const CreateNewForum({super.key});
  static const routeName = '/createNewForum';
  @override
  State<CreateNewForum> createState() => _CreateNewForumState();
}

class _CreateNewForumState extends State<CreateNewForum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(      
        body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.only(top:MediaQuery.of(context).padding.top + 20,left:10,right:10,bottom:10),
                    height: 130,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFF372637),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => {Navigator.of(context).pop()},
                          child: Icon(Icons.keyboard_arrow_left_rounded,
                              size: 32, color: white),
                        ),
                        Text(
                          "Create Post",
                          style: TextStyle(
                              color: white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 65,
                          height: 30,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:accentOrange),
                          child:Center(child: Text('Post',style:TextStyle(color:white,fontWeight: FontWeight.bold)))
                        )
                      ],
                    )),
              ],
            )));
  }
}