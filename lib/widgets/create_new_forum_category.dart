import 'package:flutter/material.dart';

import '../models/colors.dart';

class CreateNewForumCategory extends StatelessWidget {
  IconData icon;
  String text;
  CreateNewForumCategory(this.icon,this.text);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Row(
        children: [
          Container(
            child: Icon(
              icon,
              size: 25,
              color: white,
            ),
          ),
          SizedBox(width:10),
          Text(
            text,
            style: TextStyle(
              color: white,
              fontSize: 18,
            ),
          ),                    
        ],
      ),
    );
  }
}