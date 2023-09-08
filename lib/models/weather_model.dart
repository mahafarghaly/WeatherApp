import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;
  String icon;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName,
      required this.icon});
  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
      date: DateTime.parse(data['location']['localtime']),
      temp: jsonData['avgtemp_c'],
      maxTemp: jsonData['maxtemp_f'],
      minTemp: jsonData['mintemp_c'],
      weatherStateName: jsonData['condition']['text'],
      icon: jsonData['condition']['icon'],
    );
  }
  @override
  String toString() {
    return 'temp =$temp minTemp= $minTemp data =$date icon=$icon';
  }

  MaterialColor getThemeColor() {
    if (weatherStateName == 'Clear' ||
        weatherStateName == 'Light Cloud' ||
        weatherStateName == 'Sunny')
      return Colors.orange;
    else if (weatherStateName == 'Sleet' || weatherStateName == 'Hail')
      return Colors.blue;
    else if (weatherStateName == 'Heavy Cloud')
      return Colors.blueGrey;
    else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers')
      return Colors.blue;
    else
      return Colors.blue;
  }
}
