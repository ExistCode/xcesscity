import 'dart:io';

import 'package:flutter/material.dart';
import 'package:xcesscity/models/colors.dart' as custom_colors;

class PotholePhotoView extends StatelessWidget {
  final File? file;
  const PotholePhotoView({super.key, this.file});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
          color: custom_colors.accentOrange.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20)),
      child: (file == null)
          ? _buildEmptyView()
          : Image.file(file!, fit: BoxFit.cover),
    );
  }

  Widget _buildEmptyView() {
    return const Center(
        child: Text(
      'Pothole Detection',
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
    ));
  }
}
