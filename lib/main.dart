import 'package:flutter/material.dart';
import 'package:flutter_weather_application/weather_data.dart';
import 'package:flutter_weather_application/weather_template.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'W E A T H E R'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Parent>? future;
  WeatherApiService apiService =
      WeatherApiService(lat: 29.395721, lon: 71.683334);
  void _search() {
    setState(() {
      future = apiService.getWeatherData();
    });

    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return const CityDialog();
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
          child: FutureBuilder(
              future: future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.none) {
                  return const Text('Press the button to fetch data');
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else {
                  if (snapshot.hasError) {
                    return Text('Error : ${snapshot.error}');
                  } else {
                    return Column(
                      children: [
                        Text(
                            'Temperature: ${snapshot.data!.main.temp.toString()}'),
                        Text(
                            'Humidity: ${snapshot.data!.main.humidity.toString()}'),
                        Text(
                            'Pressure: ${snapshot.data!.main.pressure.toString()}'),
                        Text(
                            'Wind Speed: ${snapshot.data!.wind.speed.toString()}'),
                        Text(
                            'Wind Degree: ${snapshot.data!.wind.deg.toString()}'),
                      ],
                    );
                  }
                }
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: _search,
        tooltip: 'Increment',
        child: const Icon(Icons.search),
      ),
    );
  }
}
