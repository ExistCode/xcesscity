import 'package:flutter/material.dart';

import '../models/colors.dart';

class ForumTopBar extends StatelessWidget {
  const ForumTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            left: 20, right: 20, top: MediaQuery.of(context).padding.top),
        height: 110,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFF372637),
        ),
        child: Row(
          children: [
            const Image(image: AssetImage('lib/assets/images/xcessCity.png')),
            const Spacer(),
            Icon(Icons.search, size: 32, color: white)
          ],
        ));
  }
}
