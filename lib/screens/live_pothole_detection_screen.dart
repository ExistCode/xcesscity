import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xcesscity/models/colors.dart' as custom_colors;
import 'package:xcesscity/screens/write_report_screen.dart';
import 'package:xcesscity/widgets/camera_view.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
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

class LivePotholeDetectionScreen extends StatefulWidget {
  static const routeName = '/live-pothole-detection';
  const LivePotholeDetectionScreen({super.key});

  @override
  State<LivePotholeDetectionScreen> createState() =>
      _LivePotholeDetectionScreenState();
}

class _LivePotholeDetectionScreenState
    extends State<LivePotholeDetectionScreen> {
  static late String lat;
  static late String long;
  String stAddress = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCurrentLocation().then((value) async {
      lat = '${value.latitude}';
      long = '${value.longitude}';

      changeToAddress(double.parse(lat), double.parse(long));

      // Convert//

      print('Lat:$lat , Long:$long');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: custom_colors.backgroundBlack,
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      body: Stack(children: [
        CameraView(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            height: 320,
            width: double.infinity,
            decoration: BoxDecoration(color: custom_colors.backgroundBlack),
            child:
                Column(children: [_buildResultView(), _buildPickPhotoButton()]),
          ),
        )
      ]),
    );
  }

  Widget _buildPickPhotoButton() {
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
                changeToAddress(double.parse(lat), double.parse(long));
                createNewPothole(
                    "Marker1", stAddress, lat, long, DateTime.now());

                // Convert//

                print('Lat:$lat , Long:$long');
                print("stAddress: ${stAddress}");
              });
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

  Widget _buildResultView() {
    // var title = '';

    // if (_resultStatus == _ResultStatus.notFound) {
    //   title = 'Fail to recognise';
    // } else if (_resultStatus == _ResultStatus.found) {
    //   title = _plantLabel;
    // } else {
    //   title = '';
    // }

    // //
    // var accuracyLabel = '';
    // var potholeLabel = '';
    // if (_resultStatus == _ResultStatus.found) {
    //   potholeLabel = 'Pothole: ${((_focus * 100)).toStringAsFixed(2)}%';
    //   accuracyLabel = 'Accuracy: ${((_accuracy * 100)).toStringAsFixed(2)}%';
    // }

    return Container(
      width: 600,
      child: Column(children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                "Located at: ${stAddress}",
                style: TextStyle(color: custom_colors.white),
              ),
              Text("Time: ${DateTime.now().toString()}",
                  style: TextStyle(
                      color: custom_colors.accentOrange, fontSize: 13)),
            ],
          ),
          width: 500,
          height: 80,
          decoration: BoxDecoration(
              color: custom_colors.black,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        ),
        GestureDetector(
          onTap: (() {
            _getCurrentLocation().then((value) async {
              lat = '${value.latitude}';
              long = '${value.longitude}';
              createNewPothole("Marker1", stAddress, lat, long, DateTime.now());
              changeToAddress(double.parse(lat), double.parse(long));

              // Convert//

              print('Lat:$lat , Long:$long');
            });

            changeToAddress(double.parse(lat), double.parse(long));
            sendEmail(stAddress);
            print(stAddress);
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

  Future sendEmail(String address) async {
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
          "template_params": {
            "date_time": DateTime.now().toString(),
            "pothole_location": address,
          }
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
    print("Placemark : ${placemark}");
    stAddress = placemark.reversed.last.thoroughfare.toString();
    print("Testing Address: ${stAddress}");
    return stAddress;
  }

  Future<void>? createNewPothole(
      String title, String address, String lat, String long, DateTime time) {
    FirebaseFirestore.instance.collection('Pothole').doc().set({
      "title": title,
      "address": address,
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
}
