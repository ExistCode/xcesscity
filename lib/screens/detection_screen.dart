
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

import 'package:xcesscity/screens/emergency_screen.dart';
import 'package:xcesscity/screens/write_report_screen.dart';
import 'package:image/image.dart' as img;
import 'package:xcesscity/widgets/crime_map.dart';
import 'package:xcesscity/widgets/explore_row_category.dart';
import 'package:xcesscity/widgets/pothole_view.dart';
import '../classifier/classifier.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/colors.dart' as custom_colors;
import 'package:xcesscity/widgets/crime_map.dart';

const _labelsFileName = 'assets/labels.txt';
const _modelFileName = 'model_unquant.tflite';

class DetectionScreen extends StatefulWidget {
  static const routeName = '/detectionScreen';
  const DetectionScreen({super.key});

  @override
  State<DetectionScreen> createState() => _DetectionScreenState();
}

enum _ResultStatus {
  notStarted,
  notFound,
  found,
}

class _DetectionScreenState extends State<DetectionScreen> {
  bool _isAnalyzing = false;
  static late String lat;
  static late String long;
  File? _selectedImageFile;
  final imagePicker = ImagePicker();
  // Result
  _ResultStatus _resultStatus = _ResultStatus.notStarted;
  String _potHoleStatus = ''; // Name of Error Message
  double _accuracy = 0.0;
  double _focus = 0.0;

  late Classifier _classifier;

  @override
  void initState() {
    super.initState();
    // _loadClassifier();
  }

  Future<void> _loadClassifier() async {
    debugPrint(
      'Start loading of Classifier with '
      'labels at $_labelsFileName, '
      'model at $_modelFileName',
    );

    final classifier = await Classifier.loadWith(
      labelsFileName: _labelsFileName,
      modelFileName: _modelFileName,
    );

    if (classifier != null) {
      setState(() {
        _classifier = classifier;
      });
    } else {
      debugPrint('Failed to load classifier');
      // Handle the error if necessary
    }
  }
  String stAddress = '';
  String stTime = '';

  Future<void>? createNewPothole(
      String title, String lat, String long, DateTime time) {
    FirebaseFirestore.instance.collection('Pothole').doc().set({
      "title": title,
      "lat": lat,
      "long": long,
      "reportedDate": time,
    });
  }

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permission are permanently denied');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future getImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _selectedImageFile = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => {Navigator.of(context).pop()},
                  child: Icon(
                    Icons.keyboard_arrow_left_rounded,
                    size: 35,
                    color: custom_colors.white,
                  ),
                ),
              ]),
          Container(
              child: _selectedImageFile == null
                  ? Container(
                      width: 300,
                      height: 420,
                    )
                  : Image.file(_selectedImageFile!)),
          Container(
            width: 600,
            height: 90,
            child: Column(children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 2),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Icon(
                    Icons.document_scanner_outlined,
                    color: custom_colors.white,
                  ),
                  Text(
                    'Detected : Fight',
                    style: TextStyle(color: custom_colors.white, fontSize: 12),
                  ),
                  Spacer(),
                  Container(
                    child: Column(children: [
                      Text(stAddress,
                          style: TextStyle(color: custom_colors.white)),
                      Text(stTime,
                          style: TextStyle(
                              color: custom_colors.accentOrange, fontSize: 12)),
                    ]),
                  ),
                ]),
                width: 500,
                height: 50,
                decoration: BoxDecoration(
                    color: custom_colors.black,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
              ),
              GestureDetector(
                onTap: (() {
                  sendEmail();
                }),
                child: Container(
                  width: 500,
                  height: 40,
                  decoration: BoxDecoration(
                      color: custom_colors.secondary,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Submit',
                          style: TextStyle(
                              color: custom_colors.white, fontSize: 18),
                        )
                      ]),
                ),
              ),
            ]),
          ),
          Container(
            padding: EdgeInsets.all(40),
            child: Row(children: [
              Icon(
                Icons.dialpad,
                color: custom_colors.white,
              ),
              Spacer(),
              //Camera Button//
              GestureDetector(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: custom_colors.accentOrange,
                        border:
                            Border.all(color: custom_colors.white, width: 2)),
                    child: Icon(
                      Icons.camera_alt,
                      color: custom_colors.white,
                    ),
                  ),
                  //This is where it will pass the detected lat/lng when camera btn pressed//
                  onTap: (() {
                    _getCurrentLocation().then((value) async {
                      lat = '${value.latitude}';
                      long = '${value.longitude}';
                      createNewPothole("Marker1", lat, long, DateTime.now());
                      changeToAddress(double.parse(lat), double.parse(long));

                      // Convert//

                      print('Lat:$lat , Long:$long');
                    });
                    getImage();
                  })
                  // () => {

                  //   //Navigator.of(context).pushNamed(DetectionScreen.routeName)
                  // },
                  ),
              Spacer(),
              GestureDetector(
                onTap: () =>
                    {Navigator.of(context).pushNamed(WriteReport.routeName)},
                child: Icon(
                  Icons.folder_outlined,
                  color: custom_colors.white,
                ),
              ),
            ]),
          )
        ],
      ),
    ));
  }


  void _onPickPhoto(ImageSource source) async {
    final pickedFile = await imagePicker.pickImage(source: source);

    if (pickedFile == null) {
      return;
    }

    final imageFile = File(pickedFile.path);
    setState(() {
      _selectedImageFile = imageFile;
    });

    _analyzeImage(imageFile);
  }

  void _analyzeImage(File image) {
    _setAnalyzing(true);

    final imageInput = img.decodeImage(image.readAsBytesSync())!;

    final resultCategory = _classifier.predict(imageInput);

    final result = resultCategory.score >= 0.8
        ? _ResultStatus.found
        : _ResultStatus.notFound;
    final potHoleStatus = resultCategory.label;
    final focus = resultCategory.score * 0.9;
    final accuracy = resultCategory.score;

    _setAnalyzing(false);

    setState(() {
      _resultStatus = result;
      _potHoleStatus = potHoleStatus;
      _focus = focus;
      _accuracy = accuracy;
    });
  }


  void showSnackBar(String text) {
    final snackBar = SnackBar(
      content: Text(
        text,
        style: TextStyle(fontSize: 20),
      ),
      backgroundColor: Colors.green[400],
    );

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  Future sendEmail() async {
    var url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    const serviceId = "service_1tcx2fe";
    const templateId = "template_qax32ig";
    const userId = "r1orxg9QLHg53YbPM";

    final response = await http.post(url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json'
        },
        body: json.encode({
          "service_id": serviceId,
          "template_id": templateId,
          "user_id": userId,
          // "template_params": {
          //   "message": 'The pothole is spotted at LOCATION',
          // }
        }));
    showSnackBar('Report sent Successfully!');
    return response.statusCode;


  void _liveLocation() {
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
    );

    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      lat = position.latitude.toString();
      long = position.longitude.toString();

      print('Latitude:$lat , Longitude:$long');
    });

  }

  Future<void> changeToAddress(double lat, double long) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, long);
    stAddress = placemark.reversed.last.subAdministrativeArea.toString();
    stTime = DateTime.now().toString();
    print("Testing Address: ${stAddress}");
  }

  Widget _buildPhotoView() {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        PotholePhotoView(file: _selectedImageFile),
        _buildAnalyzingText(),
      ],
    );
  }

  Widget _buildAnalyzingText() {
    if (!_isAnalyzing) {
      return const SizedBox.shrink();
    }
    return Text('Analyzing...',
        style: TextStyle(color: Colors.white, fontSize: 16));
  }

  void _setAnalyzing(bool flag) {
    setState(() {
      _isAnalyzing = flag;
    });
  }
}
