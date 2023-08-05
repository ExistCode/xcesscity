import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:xcesscity/models/colors.dart' as custom_colors;

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
import 'package:http/http.dart' as http;

import '../classifier/classifier.dart';

const _labelsFileName = 'assets/labels.txt';
const _modelFileName = 'model_unquant.tflite';

class PotholeDetectionScreen extends StatefulWidget {
  const PotholeDetectionScreen({super.key});
  static const routeName = '/detectionScreen';

  @override
  State<PotholeDetectionScreen> createState() => _PotholeDetectionScreenState();
}

enum _ResultStatus {
  notStarted,
  notFound,
  found,
}

class _PotholeDetectionScreenState extends State<PotholeDetectionScreen> {
  bool _isAnalyzing = false;

  static late String lat;
  static late String long;

  String stAddress = '';

  Future<void>? createNewPothole(
      String title, String address, String lat, String long, DateTime time) {
    FirebaseFirestore.instance.collection('Pothole').doc().set({
      "title": title,
      "address": address,
      "lat": lat,
      "long": long,
      "reportedDate": time,
    });

  final picker = ImagePicker();
  File? _selectedImageFile;

  // Result
  _ResultStatus _resultStatus = _ResultStatus.notStarted;
  String _plantLabel = ''; // Name of Error Message
  double _accuracy = 0.0;
  double _focus = 0.0;

  late Classifier _classifier;

  @override
  void initState() {
    super.initState();
    _loadClassifier();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0,
        backgroundColor: custom_colors.backgroundBlack,
        leading: IconButton(
          onPressed: () => {Navigator.of(context).pop()},
          icon: Icon(
            Icons.keyboard_arrow_left_rounded,
            size: 35,
            color: custom_colors.white,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            _buildPhotolView(),
            SizedBox(height: 20),
            _buildResultView(),
            _buildPickPhotoButton(
              title: 'Take a photo',
              source: ImageSource.camera,
            ),
            SizedBox(
              height: 6,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotolView() {
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

  Widget _buildTitle() {
    return Text(
      'ARCADIA',
      style: TextStyle(fontSize: 24, color: custom_colors.primaryOrange),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildPickPhotoButton({
    required ImageSource source,
    required String title,
  }) {
    return Container(
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
                  border: Border.all(color: custom_colors.white, width: 2)),
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
              _onPickPhoto(source);
            })),
        Spacer(),
        GestureDetector(
          onTap: () => {Navigator.of(context).pushNamed(WriteReport.routeName)},
          child: Icon(
            Icons.folder_outlined,
            color: custom_colors.white,
          ),
        ),
      ]),
    );
  }

  void _setAnalyzing(bool flag) {
    setState(() {
      _isAnalyzing = flag;
    });
  }

  void _onPickPhoto(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

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
    final plantLabel = resultCategory.label;
    final focus = resultCategory.score * 0.9;
    final accuracy = resultCategory.score;

    _setAnalyzing(false);

    setState(() {
      _resultStatus = result;
      _plantLabel = plantLabel;
      _focus = focus;
      _accuracy = accuracy;
    });
  }

  Widget _buildResultView() {
    var title = '';

    if (_resultStatus == _ResultStatus.notFound) {
      title = 'Fail to recognise';
    } else if (_resultStatus == _ResultStatus.found) {
      title = _plantLabel;
    } else {
      title = '';
    }

    //
    var accuracyLabel = '';
    var potholeLabel = '';
    if (_resultStatus == _ResultStatus.found) {
      potholeLabel = 'Pothole: ${((_focus * 100)).toStringAsFixed(2)}%';
      accuracyLabel = 'Accuracy: ${((_accuracy * 100)).toStringAsFixed(2)}%';
    }

    return Container(
      width: 600,
      height: 100,
      child: Column(children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 2),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Icon(
              Icons.document_scanner_outlined,
              color: custom_colors.white,
            ),
            Text(
              'Detected : ${potholeLabel}',
              style: TextStyle(color: custom_colors.white, fontSize: 12),
            ),
            Spacer(),
            Container(
              child: Column(children: [
                Text(stAddress, style: TextStyle(color: custom_colors.white)),
                Text(stTime,
                    style: TextStyle(
                        color: custom_colors.accentOrange, fontSize: 12)),
              ]),
          Container(
              child: imageFile == null
                  ? Container(
                      width: 300,
                      height: 420,
                    )
                  : Image.file(imageFile!)),
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
                      Text(DateTime.now().toString(),
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
              Container(
                width: 500,
                height: 40,
                decoration: BoxDecoration(
                    color: custom_colors.secondary,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    'Submit',
                    style: TextStyle(color: custom_colors.white, fontSize: 18),
                  )
                ]),
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
                      changeToAddress(double.parse(lat), double.parse(long));
                      createNewPothole(
                          "Marker1", stAddress, lat, long, DateTime.now());

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
          ]),
          width: 500,
          height: 50,
          decoration: BoxDecoration(
              color: custom_colors.black,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
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
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Submit',
                style: TextStyle(color: custom_colors.white, fontSize: 18),
              )
            ]),
          ),
        ),
      ]),
    );
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
  }

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

  Future<String> changeToAddress(double lat, double long) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, long);
    stAddress = placemark.reversed.last.subLocality.toString();
    print("Testing Address: ${stAddress}");
    return stAddress;
  }

  Future<void>? createNewPothole(
      String title, String lat, String long, DateTime time) {
    FirebaseFirestore.instance.collection('Pothole').doc().set({
      "title": title,
      "lat": lat,
      "long": long,
      "reportedDate": time,
    });
  }

  String stAddress = '';
  String stTime = '';

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
}
