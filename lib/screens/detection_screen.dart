import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:xcesscity/screens/emergency_screen.dart';
import 'package:xcesscity/screens/write_report_screen.dart';
import 'package:xcesscity/widgets/explore_row_category.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/colors.dart' as custom_colors;

class DetectionScreen extends StatefulWidget {
  static const routeName = '/detectionScreen';
  const DetectionScreen({super.key});

  @override
  State<DetectionScreen> createState() => _DetectionScreenState();
}

class _DetectionScreenState extends State<DetectionScreen> {
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
            width: 500,
            height: 450,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/assets/images/tempfight.png')),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
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
              Container(
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
}
