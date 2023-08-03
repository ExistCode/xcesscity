import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xcesscity/screens/emergency_screen.dart';
import 'package:xcesscity/screens/write_report_screen.dart';
import 'package:xcesscity/widgets/crime_map.dart';
import 'package:xcesscity/widgets/explore_row_category.dart';
import '../models/colors.dart' as custom_colors;
import 'package:xcesscity/widgets/crime_map.dart';

class DetectionScreen extends StatefulWidget {
  static const routeName = '/detectionScreen';
  const DetectionScreen({super.key});

  @override
  State<DetectionScreen> createState() => _DetectionScreenState();
}

class _DetectionScreenState extends State<DetectionScreen> {
  static late String lat;
  static late String long;

  Future<void>? createNewPothole(
      String title, String lat, String long, DateTime time) {
    FirebaseFirestore.instance.collection('Pothole').doc().set({
      "title": title,
      "lat": lat,
      "long": long,
      "reportedDate": time,
    });
  }

  static Future<String> getLatitude() async {
    return lat;
  }

  static Future<String> getLongitude() async {
    return long;
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

  File? imageFile;
  final imagePicker = ImagePicker();
  Future getImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      imageFile = File(image!.path);
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
                      Text('Jalan Merak 3/PJ',
                          style: TextStyle(color: custom_colors.white)),
                      Text('SUNDAY 21/7 , 15:00',
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
                      border: Border.all(color: custom_colors.white, width: 2)),
                  child: Icon(
                    Icons.camera_alt,
                    color: custom_colors.white,
                  ),
                ),
                //This is wehre it will pass the detected lat/lng when camera btn pressed//
                onTap: () => {
                  _getCurrentLocation().then((value) {
                    lat = '${value.latitude}';
                    long = '${value.longitude}';
                    createNewPothole("Marker1", lat, long, DateTime.now());
                    print('Lat:$lat , Long:$long');
                  }),
                  getImage(),
                  Navigator.of(context).pushNamed(EmergencyScreen.routeName)
                },
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
}
