import 'package:flutter/material.dart';
import 'package:xcesscity/models/colors.dart';
import 'package:xcesscity/screens/restaurant_screen.dart';

class ExploreRowCategory extends StatelessWidget {
  const ExploreRowCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
            onTap: () =>
                {Navigator.of(context).pushNamed(RestaurantScreen.routeName)},
            child: Box(Icons.attractions_outlined, "Attractions")),
        GestureDetector(
          onTap: () =>
              {Navigator.of(context).pushNamed(RestaurantScreen.routeName)},
          child: Box(Icons.food_bank_outlined, "Food"),
        ),
        GestureDetector(
          onTap: () =>
              {Navigator.of(context).pushNamed(RestaurantScreen.routeName)},
          child: Box(Icons.electrical_services_outlined, "Services"),
        ),
        GestureDetector(
          onTap: () =>
              {Navigator.of(context).pushNamed(RestaurantScreen.routeName)},
          child: Box(Icons.medical_services_outlined, "Healthcare"),
        ),
      ],
    );
  }
}

Widget Box(icon, text) {
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
          child: Icon(icon, color: white, size: 40)),
      Text(
        text,
        style: TextStyle(color: white),
      ),
    ],
  ));
}
