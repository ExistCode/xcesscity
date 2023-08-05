class PotholeReportModel {
  String address;
  String latitude;
  String longitude;
  DateTime potholeReportDate;
  String title;

  PotholeReportModel(
      {required this.address,
      required this.latitude,
      required this.longitude,
      required this.potholeReportDate,
      required this.title});
}
