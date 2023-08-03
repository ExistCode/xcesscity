import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;

class camera extends StatefulWidget {
  final VoidCallback setMarker;
  const camera({super.key, required this.setMarker});

  @override
  State<camera> createState() => _cameraState();
}

class _cameraState extends State<camera> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 20,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: custom_colors.accentOrange,
          border: Border.all(color: custom_colors.white, width: 2)),
      child: Icon(
        Icons.camera_alt,
        color: custom_colors.white,
      ),
    );
  }
}
