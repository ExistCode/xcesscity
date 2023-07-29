import 'package:flutter/material.dart';

import '../models/colors.dart';

class ForumTopBar extends StatelessWidget {
  const ForumTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding:EdgeInsets.all(10),
      height:100,
      width:double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xFF372637),),      
      child:Row(
        
        children: [
        Image(image: AssetImage('lib/assets/images/xcessCity.png')),
        Spacer(),
        Icon(Icons.search,size:32,color:white)
      ],)
    );
  }
}