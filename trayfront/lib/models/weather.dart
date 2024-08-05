class Weather {
  final double temperature;
  final double humidity;
  final double precipitation;

  Weather(
      {required this.temperature,
      required this.humidity,
      required this.precipitation});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temperature: json['temperature'].toDouble(),
      humidity: json['humidity'].toDouble(),
      precipitation: json['precipitation'].toDouble(),
    );
  }
}
