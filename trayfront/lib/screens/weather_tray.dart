import 'package:flutter/material.dart';
import '../models/weather.dart';
import '../services/api_service.dart';

class WeatherTray extends StatefulWidget {
  @override
  _WeatherTrayState createState() => _WeatherTrayState();
}

class _WeatherTrayState extends State<WeatherTray> {
  late Weather _weather;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadWeather();
  }

  void _loadWeather() async {
    setState(() {
      _isLoading = true;
    });
    _weather = await ApiService().fetchWeather();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather Info')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Temperature: ${_weather.temperature}°C'),
                Text('Humidity: ${_weather.humidity}%'),
                Text('Precipitation: ${_weather.precipitation}%'),
              ],
            ),
    );
  }
}
