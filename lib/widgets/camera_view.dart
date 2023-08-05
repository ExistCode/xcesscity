import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcesscity/widgets/scan_controller.dart';

class CameraView extends StatelessWidget {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ScanController>(
          init: ScanController(),
          builder: (controller) {
            return controller.isCameraInitialized.value
                ? Stack(
                    children: [
                      CameraPreview(controller.cameraController),
                      Positioned(
                        // top: (controller.y) * 100,
                        // right: (controller.x) * 100,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(color: Colors.green, width: 4.0)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                  decoration:
                                      BoxDecoration(color: Colors.white),
                                  child: Text("${controller.label}"))
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                : Center(
                    child: Text("Loading Preview"),
                  );
          }),
    );
  }
}
