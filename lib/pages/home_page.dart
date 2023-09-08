import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/provider/weather_provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUi() {
    setState(() {});
  }

  @override
  Widget build(context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchPage(
                                updateUi: updateUi,
                              )));
                },
                icon: Icon(Icons.search)),
          ],
          title: const Text('Weather App'),
        ),
        body: weatherData == null
            ? Center(
                //🔍 😓🙂
                child: Text(
                'There is no weather 😢start \n searching now 🔎',
                style: TextStyle(fontSize: 20, height: 1.5),
              ))
            : Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                      weatherData!.getThemeColor(),
                      weatherData!.getThemeColor()[300]!,
                      weatherData!.getThemeColor()[100]!,
                    ],
                        begin: AlignmentDirectional.topCenter,
                        end: AlignmentDirectional.bottomCenter)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(
                      flex: 3,
                    ),
                    Text(
                      Provider.of<WeatherProvider>(context).cityName!,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Updated at: ${weatherData!.date.hour.toString()}: ${weatherData!.date.minute.toString()}',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.network(weatherData!.icon),
                        Expanded(
                          child: Image(
                            image: AssetImage('assets/images/girl.jpg'),
                          ),
                        ),
                        Text(
                          '${weatherData!.temp.toInt()}',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Column(
                          children: [
                            Text(
                              'maxTemp :${weatherData!.maxTemp.toInt()}',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'minTemp :${weatherData!.minTemp.toInt()}',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      weatherData!.weatherStateName,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Spacer(
                      flex: 5,
                    ),
                  ],
                ),
              ));
  }
}
