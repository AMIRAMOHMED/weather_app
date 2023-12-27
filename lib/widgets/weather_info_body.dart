import 'package:flutter/material.dart';
import 'package:weather_app/main.dart';

import '../models/weather_model.dart';
import '../views/search_view.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key, required this.weatherModel})
      : super(key: key);
  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          getThemeColor(weatherModel.weatherCondition),
          getThemeColor(weatherModel.weatherCondition)[300]!,
          getThemeColor(weatherModel.weatherCondition)[50]!
        ], begin: Alignment.bottomRight, end: Alignment.topLeft)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SearchView(),
                  ));
                },
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    " 📌${weatherModel.cityName}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  Text(
                    " updated at: ${weatherModel.date.hour}:${weatherModel.date.minute}",
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(
                        "https:${weatherModel.image!}",
                      ),
                      Text(
                        "${weatherModel.temp.round()}°C ",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 55,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            " MaxTemp: ${weatherModel.maxTemp.round()}",
                            style: const TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "MinTemp: ${weatherModel.minTemp.round()}",
                            style: const TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    weatherModel.weatherCondition,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
            )));
  }
}
