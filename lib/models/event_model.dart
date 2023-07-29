class EventModel {
  String id;
  DateTime eventDate;
  String title;
  String eventImageUrl;

  EventModel(
      {required this.id,
      required this.eventDate,
      required this.title,
      required this.eventImageUrl});
}
