import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

//http://api.weatherapi.com/v1/forecast.json?key=6383985633944de0acb205415231507&q=Cairo&days=7
class WeatherServices {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '6383985633944de0acb205415231507';
  Future<WeatherModel> getWeather({required String cityName}) async {
    // try {
    Uri url =
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);

    WeatherModel weather = WeatherModel.fromJson(data);
    // } catch (e) {
    //   print("error is:$e");
    // }

    return weather;
  }
}
