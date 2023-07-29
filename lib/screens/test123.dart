import 'package:flutter/material.dart';
import 'package:xcesscity/models/colors.dart' as custom_colors;
import 'package:xcesscity/widgets/crime_updates_card.dart';

class test123 extends StatelessWidget {
  const test123({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: Column(
        children: [
          crimeUpdateCard(
            time: 'now',
            updates: 'sdjhaksh',
          ),
          crimeUpdateCard(
            time: '2 days ago',
            updates: 'sjhbdcfk',
          )
        ],
      ),
    );
  }
}
