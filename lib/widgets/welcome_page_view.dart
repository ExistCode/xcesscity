import 'package:flutter/material.dart';
import 'package:xcesscity/widgets/top_banner.dart';
import '../models/colors.dart' as custom_colors;
import '../models/colors.dart';

class WelcomePageView extends StatelessWidget {
  String imageUrl;
  String title;
  String description;

  WelcomePageView(
      {required this.imageUrl, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: backgroundBlack,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TopBanner(500, imageUrl, 'Welcome to XcessCITY'),
            SizedBox(height: 20),
            Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: white, fontSize: 28, fontWeight: FontWeight.w900)),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                description,
                style: TextStyle(color: white, fontSize: 14),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
