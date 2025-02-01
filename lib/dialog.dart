import 'package:flutter/material.dart';
import 'package:flutter_weather_application/weather_data.dart';
import 'package:flutter_weather_application/weather_template.dart';

class CityDialog extends StatefulWidget {
  const CityDialog({super.key});

  @override
  _CityDialogState createState() => _CityDialogState();
}

class _CityDialogState extends State<CityDialog> {
  late final TextEditingController latController;
  late final TextEditingController lonController;
  @override
  initState() {
    super.initState();

    lonController = TextEditingController();
    latController = TextEditingController();
  }

  @override
  void dispose() {
    latController.dispose();
    lonController.dispose();
    super.dispose();
  }

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
    return AlertDialog(
      title: const Text('Today\'s Weather'),
      content: Row(
        children: [
          TextField(
            controller: latController,
            decoration: const InputDecoration(
              hintText: 'Enter Latitude',
            ),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: lonController,
            decoration: const InputDecoration(
              hintText: 'Enter Longitude',
            ),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
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
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
