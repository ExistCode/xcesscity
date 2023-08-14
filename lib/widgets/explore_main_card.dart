import 'package:flutter/material.dart';
import 'package:xcesscity/models/colors.dart';

class ExploreMainCard extends StatelessWidget {
  const ExploreMainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('lib/assets/images/new-restaurant.jpg'),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        color: accentOrange,
        width: double.infinity,
        height: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New restaurant opened up near you',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: white, fontSize: 17),
            ),
            // Text(
            //     'Steaks and lobster is a restaurant founded by 2 young entrepreneurs. They have a vision of   . . .',
            //    style: TextStyle(fontSize:12),
            //     ),
          ],
        ),
      ),
    );
  }
}
