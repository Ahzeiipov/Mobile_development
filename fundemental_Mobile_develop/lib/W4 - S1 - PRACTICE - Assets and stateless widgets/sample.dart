import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: WeatherApp(),
  ));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Forecast'),
      ),
      body: Center(
        child: Row(
          // Use Row to display WeatherCard widgets horizontally
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WeatherCard(
              day: 'Mon',
              condition: WeatherCondition.sunny,
              temperatureMin: 10,
              temperatureMax: 20,
            ),
            const SizedBox(width: 20), // Add space between cards
            WeatherCard(
              day: 'Tue',
              condition: WeatherCondition.rainy,
              temperatureMin: 8,
              temperatureMax: 18,
            ),
            const SizedBox(width: 20), // Add space between cards
            WeatherCard(
              day: 'Tue',
              condition: WeatherCondition.rainy,
              temperatureMin: 8,
              temperatureMax: 18,
            ),
          ],
        ),
      ),
    );
  }
}

enum WeatherCondition { sunny, rainy, cloudy, snowy }

class WeatherCard extends StatelessWidget {
  final String day;
  final WeatherCondition condition;
  final int temperatureMin;
  final int temperatureMax;

  const WeatherCard({
    Key? key,
    required this.day,
    required this.condition,
    required this.temperatureMin,
    required this.temperatureMax,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String conditionText = _getConditionText(condition);
    Color conditionColor = _getConditionColor(condition);

    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              day,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              conditionText,
              style: TextStyle(fontSize: 20, color: conditionColor),
            ),
            const SizedBox(height: 8),
            Text(
              'Temperature: $temperatureMin°C - $temperatureMax°C',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  String _getConditionText(WeatherCondition condition) {
    switch (condition) {
      case WeatherCondition.sunny:
        return 'Sunny';
      case WeatherCondition.rainy:
        return 'Rainy';
      case WeatherCondition.cloudy:
        return 'Cloudy';
      case WeatherCondition.snowy:
        return 'Snowy';
      default:
        return '';
    }
  }

  Color _getConditionColor(WeatherCondition condition) {
    switch (condition) {
      case WeatherCondition.sunny:
        return Colors.yellow;
      case WeatherCondition.rainy:
        return Colors.blue;
      case WeatherCondition.cloudy:
        return Colors.grey;
      case WeatherCondition.snowy:
        return Colors.white;
      default:
        return Colors.black;
    }
  }
}
