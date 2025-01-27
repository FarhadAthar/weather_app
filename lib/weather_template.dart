import 'dart:convert';
import 'package:flutter_weather_application/weather_data.dart';
import 'package:http/http.dart';

abstract class ApiService {
  final _BASE_URL = 'https://api.openweathermap.org/data/2.5/weather?';
  String get API_URL;
  String get url => _BASE_URL + API_URL;

  fetch() async {
    var uri = Uri.parse(url);
    var response = await get(uri);
    if (response.isSuccessful) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'Failed to load data: ${response.statusCode} - ${response.body}');
    }
  }
}

class WeatherApiService extends ApiService {
  WeatherApiService({required this.lat, required this.lon});
  double lat;
  double lon;
  String apiKey = '53b9a75b6c79c56f6aecc61cf5b4b49a';
  @override
  String get API_URL =>
      'lat=$lat&lon=$lon&appid=$apiKey';

  Future<Parent> getWeatherData() async {
    final weather = await fetch();
    if (weather is Map<String, dynamic>) {
      return Parent.fromMap(weather);
    } else {
      throw Exception('Failed to load data, invalid response');
      
    }
  }
}

extension StatusCodes on Response {
  bool get isSuccessful => statusCode >= 200 && statusCode < 300;
}
