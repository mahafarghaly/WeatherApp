import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

WeatherModel? weatherData;

class SearchPage extends StatelessWidget {
  String? cityName;
  SearchPage({this.updateUi});
  VoidCallback? updateUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Search A City')),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
              onChanged: (data) {
                cityName = data;
              },
              onSubmitted: (data) async {
                cityName = data;
                WeatherServices services = WeatherServices();
                WeatherModel weather =
                    await services.getWeather(cityName: cityName!);
                Provider.of<WeatherProvider>(context, listen: false)
                    .weatherData = weather;
                Provider.of<WeatherProvider>(context, listen: false).cityName =
                    cityName;

                Navigator.pop(context);
                print(weather);
              },
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                  suffixIcon: InkWell(
                      onTap: () async {
                        WeatherServices services = WeatherServices();
                        WeatherModel weather =
                            await services.getWeather(cityName: cityName!);
                        Provider.of<WeatherProvider>(context, listen: false)
                            .weatherData = weather;
                        Provider.of<WeatherProvider>(context, listen: false)
                            .cityName = cityName;

                        Navigator.pop(context);
                        print(weather);
                      },
                      child: Icon(Icons.search)),
                  border: OutlineInputBorder(),
                  hintText: 'Enter City Name',
                  label: Text('Search'))),
        )));
  }
}
