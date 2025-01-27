import 'dart:convert';
import 'package:flutter_weather_application/weather_data.dart';
import 'package:http/http.dart';

extension API on Response {
  bool get success => statusCode >= 200 && statusCode < 300;
}

abstract class Template {
  final String base_url = 'https://api.openweathermap.org/data/2.5/weather?';
  String get api_url;
  String get url => base_url + api_url;

  Future<dynamic> fetch({String endPoint = ''}) async {
    var response = await get(Uri.parse(url + endPoint));
    if (response.success) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          "Failed to fetch data from ${url + endPoint}: ${response.statusCode} - ${response.body}");
    }
  }
}

class MyAPIService extends Template {
  final double lat;
  final double lon;

  MyAPIService({required this.lat, required this.lon});

  @override
  String get api_url =>
      'lat=$lat&lon=$lon&appid=53b9a75b6c79c56f6aecc61cf5b4b49a';

  Future<WeatherAPI> getWeatherData() async {
    try {
      final jsonData = await fetch();

      return WeatherAPI.fromJson(jsonData);
    } catch (e) {
      throw Exception("Error fetching weather data: $e");
    }
  }
}
