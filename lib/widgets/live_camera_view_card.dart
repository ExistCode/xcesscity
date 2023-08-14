import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcesscity/widgets/scan_controller.dart';
import 'package:xcesscity/models/colors.dart' as custom_colors;

class LiveCameraView extends StatelessWidget {
  const LiveCameraView({super.key});

  @override
  Widget build(BuildContext context) {
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
                : const Center(
                    child: Text("Loading Preview"),
                  );
          }),
    );
  }
}
