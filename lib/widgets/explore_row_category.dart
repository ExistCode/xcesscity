import 'package:flutter/material.dart';
import 'package:xcesscity/models/colors.dart';

class ExploreRowCategory extends StatelessWidget {
  const ExploreRowCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Box(Icons.attractions_outlined,"Attractions"),
        Box(Icons.food_bank_outlined,"Food"),
        Box(Icons.electrical_services_outlined,"Services"),
        Box(Icons.medical_services_outlined,"Healthcare"),
      ],
    );
  }
}

Widget Box(icon,text){
  return Container(
        child: Column(
      children: [
        Container(
          width: 60,
          height: 60,
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: secondary,
            borderRadius: BorderRadius.circular(16),
          ),
          child:
          Icon(icon,color:white,size:40)
        ),
        Text(text,style: TextStyle(color:white),),
      ],
    ));
}