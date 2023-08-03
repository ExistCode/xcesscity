import 'package:flutter/material.dart';

import '../models/colors.dart';

class SettingCategory extends StatelessWidget {
  IconData icon;
  String category;
  String data;

  SettingCategory(this.icon, this.category, this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Row(
        children: [
          Container(
            child: Icon(
              icon,
              size: 20,
              color: white,
            ),
          ),
          SizedBox(width: 10),
          Text(
            category,
            style: TextStyle(
              color: white,
              fontSize: 14,
            ),
          ),
          Spacer(),
          Text(
            data,
            style: TextStyle(fontSize: 14, color: white.withOpacity(0.5)),
          ),
        ],
      ),
    );
  }
}
