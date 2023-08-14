import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:xcesscity/models/colors.dart';
import 'package:xcesscity/screens/restaurant_screen.dart';

class ExploreBigRow extends StatelessWidget {
  const ExploreBigRow({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          {Navigator.of(context).pushNamed(RestaurantScreen.routeName)},
      child: Container(
          height: 135,
          width: 190,
          clipBehavior: Clip.hardEdge,
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage('lib/assets/images/splashMania.png'),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20)),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 190,
                color: accentOrange,
                child: AutoSizeText(
                  'SplashMania',
                  style: TextStyle(fontWeight: FontWeight.bold, color: white),
                ),
              ))),
    );
  }
}
