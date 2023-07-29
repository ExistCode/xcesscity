import 'package:xcesscity/widgets/crime_updates.dart';

class crimeUdpatesModel {
  static final updates = [
    crimeUpdates(
        time: "Now",
        updates: "A small sized pothole spotted at Jalan Merak 1/11")
  ];
}

class crimeUpdates {
  final String time;
  final String updates;

  crimeUpdates({
    required this.time,
    required this.updates,
  });
}
