import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xcesscity/models/pothole_report_model.dart';

import '../models/location_reported.dart';

class LocationProvider with ChangeNotifier {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  List<String> potholeIdList = [];
  List<PotholeReportModel> loadedPotholeReported = [];

  Future<void>? createNewPothole(
      String title, String address, String lat, String long, DateTime time) {
    FirebaseFirestore.instance.collection('Pothole').doc().set({
      "address": address,
      "title": title,
      "lat": lat,
      "long": long,
      "reportedDate": time,
    });
  }

  Future<void> fetchPotholeId() async {
    print('fetch');
    try {
      await FirebaseFirestore.instance.collection('Pothole').get().then(
        (snapshot) {
          snapshot.docs.forEach(
            (pothole) {
              potholeIdList.add(pothole.reference.id);
            },
          );
        },
      );
      print('Success! fetched forumId List: ${potholeIdList}');
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> fetchAllPotholeReported() async {
    for (int i = 0; i < potholeIdList.length; i++) {
      await fetchPotholeDataFromId(potholeIdList[i]);
    }
    print('all done');
  }

  Future<void> fetchPotholeDataFromId(String potholeId) async {
    await FirebaseFirestore.instance
        .collection('Pothole')
        .doc(potholeId)
        .get()
        .then(
      (snapshot) {
        PotholeReportModel loadedPothole = PotholeReportModel(
          title: snapshot.data()!['title'],
          latitude: snapshot.data()!['lat'],
          longitude: snapshot.data()!['long'],
          potholeReportDate: DateTime.now(),
          address: snapshot.data()!['address'],
        );
        loadedPotholeReported.add(loadedPothole);
        print('fetched ${snapshot.data()!['title']}');
      },
    );
  }
}
