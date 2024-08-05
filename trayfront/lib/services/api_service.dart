import 'dart:convert';
import 'package:http/http.dart' as http;
import 'config.dart';

class ApiService {
  final String baseUrl = '###';

  Future<Map<String, dynamic>> getWeather(String city) async {
    final response = await http.get(Uri.parse('$baseUrl/weather/?city=$city'));
    return json.decode(response.body);
  }

  Future<List<dynamic>> getEvents(String city) async {
    final response = await http.get(Uri.parse('$baseUrl/events/?city=$city'));
    return json.decode(response.body);
  }
}
