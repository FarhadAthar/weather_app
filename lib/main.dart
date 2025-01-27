import 'package:flutter/material.dart';
import 'package:flutter_weather_application/weather_data.dart';
import 'package:flutter_weather_application/weather_template.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController latController = TextEditingController();
  final TextEditingController lonController = TextEditingController();
  String weatherInfo = '';
  bool isLoading = false;

  Future<void> getWeatherData(double lat, double lon) async {
    setState(() {
      isLoading = true;
      weatherInfo = '';
    });

    try {
      final apiService = MyAPIService(lat: lat, lon: lon);
      WeatherAPI weatherData = await apiService.getWeatherData();

      setState(() {
        isLoading = false;
        weatherInfo = '''
        City: ${weatherData.name}
        Temperature: ${weatherData.main?.temp}°C
        Weather: ${weatherData.weather?.first.description}
        Humidity: ${weatherData.main?.humidity}%
        Wind Speed: ${weatherData.wind?.speed} m/s
        ''';
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        weatherInfo = 'Error: ${e.toString()}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('Open Weather API'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: latController,
              decoration: InputDecoration(
                labelText: 'Enter Latitude',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextField(
              controller: lonController,
              decoration: InputDecoration(
                labelText: 'Enter Longitude',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
              onPressed: () {
                final lat = double.tryParse(latController.text);
                final lon = double.tryParse(lonController.text);

                if (lat != null && lon != null) {
                  getWeatherData(lat, lon);
                } else {
                  setState(() {
                    weatherInfo = 'Please enter valid latitude and longitude';
                  });
                }
              },
              child: Text(
                'Get Weather',
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 20),
            isLoading
                ? CircularProgressIndicator()
                : Text(
                    weatherInfo,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
          ],
        ),
      ),
    );
  }
}
