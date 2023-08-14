import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:permission_handler/permission_handler.dart';

class ScanController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initCamera();
    initTFLite();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    cameraController.dispose();
  }

  late CameraController cameraController;
  late List<CameraDescription> cameras;

  var cameraCount = 0;
  var x, y, w, h = 0.0;
  var label = "";

  var isCameraInitialized = false.obs;

  initCamera() async {
    if (await Permission.camera.request().isGranted) {
      cameras = await availableCameras();
      cameraController = CameraController(cameras[0], ResolutionPreset.max);
      await cameraController.initialize().then((value) {
        cameraController.startImageStream((image) {
          cameraCount++;
          if (cameraCount % 10 == 0) {
            cameraCount = 0;
            objectDetector(image);
          }
        });
        update();
      });
      isCameraInitialized(true);
      update();
    } else {
      print("Permission denied");
    }
  }

  objectDetector(CameraImage image) async {
    var detector = await Tflite.runModelOnFrame(
        bytesList: image.planes.map((e) {
          return e.bytes;
        }).toList(),
        asynch: true,
        imageHeight: image.height,
        imageWidth: image.width,
        imageMean: 127.5,
        imageStd: 127.5,
        numResults: 1,
        rotation: 90,
        threshold: 0.1);

    if (detector != null) {
      var ourDetectedObject = detector.first;
      if ((detector.first['confidence'] * 100) > 45) {
        label = detector.first['label'].toString();
      } else {
        print("confidence = null");
      }
      update();
    }
  }

  initTFLite() async {
    await Tflite.loadModel(
        model: "assets/model_unquant.tflite",
        labels: "assets/labels.txt",
        isAsset: true,
        numThreads: 1,
        useGpuDelegate: false);
  }
}
