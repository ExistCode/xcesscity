import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcesscity/widgets/scan_controller.dart';
import 'package:xcesscity/models/colors.dart' as custom_colors;

class CameraView extends StatelessWidget {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    bool _isPothole;

    return Scaffold(
      body: GetBuilder<ScanController>(
          init: ScanController(),
          builder: (controller) {
            return controller.isCameraInitialized.value
                ? Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top + 20),
                    child: Stack(
                      children: [
                        CameraPreview(controller.cameraController),
                        Container(
                            width: 200,
                            height: 60,
                            decoration: BoxDecoration(
                                color: controller.label == "Potholes"
                                    ? custom_colors.accentOrange
                                    : custom_colors.white),
                            child: Center(child: Text("${controller.label}")))
                      ],
                    ),
                  )
                : Center(
                    child: Text("Loading Preview"),
                  );
          }),
    );
  }
}
