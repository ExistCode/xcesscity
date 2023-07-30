import 'package:flutter/material.dart';
import 'package:xcesscity/models/colors.dart';
import 'package:xcesscity/screens/detection_screen.dart';

class WriteReport extends StatefulWidget {
  static const routeName = '/writeReport';
  const WriteReport({super.key});

  @override
  State<WriteReport> createState() => _WriteReportState();
}

class _WriteReportState extends State<WriteReport> {
  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final datetimeController = TextEditingController();
  final incidentController = TextEditingController();
  final detailsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20),
            width: double.infinity,
            height: double.infinity,
            child: Column(children: [
              Container(
                padding: EdgeInsets.only(left: 10, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () => {
                              Navigator.of(context)
                                  .pop(DetectionScreen.routeName)
                            },
                        child: Icon(Icons.keyboard_arrow_left_rounded,
                            color: white, size: 50)),
                    Text("Write A Report",
                        style: TextStyle(
                            fontSize: 25,
                            color: white,
                            fontWeight: FontWeight.bold)),
                    Icon(
                      Icons.folder,
                      color: white,
                      size: 30,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  child: Expanded(
                child: Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xFF433957),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFieldWidget("Name :", 45.0, 1, nameController),
                        SizedBox(height: 20),
                        TextFieldWidget(
                            "Location :", 45.0, 1, locationController),
                        SizedBox(height: 20),
                        TextFieldWidget(
                            "Date & Time :", 45.0, 1, datetimeController),
                        SizedBox(height: 20),
                        TextFieldWidget(
                            "Incident Type :", 45.0, 1, incidentController),
                        SizedBox(height: 20),
                        TextFieldWidget(
                            "Details :", 100.0, 3, detailsController),
                        SizedBox(height: 20),
                        Center(
                          child: Container(
                            width: 200,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: accentOrange,
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                  color: accentOrange.withOpacity(0.7),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Text(
                              "Submit",
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    )),
              ))
            ])));
  }

  Widget TextFieldWidget(text, height, lines, controller) {
    return Container(
        child: Container(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text,
            style: TextStyle(
                color: white, fontWeight: FontWeight.bold, fontSize: 17.5)),
        SizedBox(height: 5),
        Container(
          height: height,
          child: TextField(
            maxLines: lines,
            style: TextStyle(color: black),
            controller: controller,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              filled: true,
              fillColor: white,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 5)),
            ),
          ),
        )
      ],
    )));
  }
}
