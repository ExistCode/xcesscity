import 'package:flutter/material.dart';
import '../models/colors.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: backgroundBlack,
      child: Center(
        child: CircularProgressIndicator(
          color: primaryOrange,
        ),
      ),
    );
  }
}
