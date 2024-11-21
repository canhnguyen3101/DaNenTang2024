import 'package:lab9/networking.dart';

import 'location.dart';
import 'networking.dart';

const apiKey = 'YOUR_API_KEY';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    return await networkHelper.getData();
  }
}
