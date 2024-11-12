import 'package:flutter/material.dart';

enum Weather { sunny, rainy, cloudy, snowy }

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            WeatherForecast(
              day: 'Monday',
              weather: Weather.sunny,
              max: 18,
              min: -1,
            ),
            SizedBox(
              width: 50,
            ),
            WeatherForecast(
              day: 'Tuesday',
              weather: Weather.rainy,
              max: 18,
              min: 10,
            ),
            SizedBox(
              width: 50,
            ),
            WeatherForecast(
              day: 'Wednesday',
              weather: Weather.cloudy,
              max: 18,
              min: 10,
            ),
            SizedBox(
              width: 50,
            ),
            WeatherForecast(
              day: 'Thursday',
              weather: Weather.snowy,
              max: 18,
              min: 10,
            ),
          ],
        ),
      ),
    ),
  ));
}

class WeatherForecast extends StatelessWidget {
  final String day;
  final int min;
  final int max;
  final Weather weather;

  const WeatherForecast(
      {super.key,
      required this.day,
      required this.max,
      required this.min,
      required this.weather});

  @override
  Widget build(BuildContext context) {
    IconData weathericon;
    Color colorIcon;
    switch (weather) {
      case Weather.sunny:
        weathericon = Icons.wb_sunny;
        colorIcon = Colors.yellow;
        break;
      case Weather.rainy:
        weathericon = Icons.thunderstorm;
        colorIcon = const Color.fromARGB(255, 36, 148, 240);
        break;
      case Weather.cloudy:
        weathericon = Icons.cloud;
        colorIcon = Colors.lightBlue;
        break;
      case Weather.snowy:
        weathericon = Icons.ac_unit;
        colorIcon = Colors.lightBlue;
        break;
      default:
        weathericon = Icons.help;
        colorIcon = Colors.white;
    }

    return Container(
      padding: const  EdgeInsets.fromLTRB(50, 30, 50, 30),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Text( day, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(day,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 10,
          ),
          Icon(
            weathericon,
            color: colorIcon,
            size: 80,
          ),

          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$max°',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(
                width: 10,
              ),
              Text('$min°',
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey)),
            ],
          )
        ],
      ),
    );
  }
}
