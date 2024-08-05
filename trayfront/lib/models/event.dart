class Event {
  final String name;
  final String venue;
  final String date;

  Event({required this.name, required this.venue, required this.date});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      name: json['name'],
      venue: json['venue'],
      date: json['date'],
    );
  }
}
