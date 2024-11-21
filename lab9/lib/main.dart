import 'package:flutter/material.dart';
import 'weather.dart';

void main() => runApp(ClimaApp());

class ClimaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double temperature = 0.0; // Default value
  String cityName = ''; // Default value
  String weatherMessage = 'Loading...'; // Default value

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    try {
      var weatherData = await WeatherModel().getLocationWeather();
      updateUI(weatherData);
    } catch (e) {
      setState(() {
        weatherMessage = 'Failed to load weather data';
      });
      print('Error: $e');
    }
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0.0;
        cityName = '';
        weatherMessage = 'Unable to get weather data';
        return;
      }
      temperature = weatherData['main']['temp'];
      cityName = weatherData['name'];
      var condition = weatherData['weather'][0]['id'];
      weatherMessage = '${getWeatherIcon(condition)} in $cityName';
    });
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: weatherMessage.isNotEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    weatherMessage,
                    style: TextStyle(fontSize: 40.0),
                  ),
                  Text(
                    '${temperature.toStringAsFixed(1)}°',
                    style: TextStyle(fontSize: 80.0),
                  ),
                ],
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
