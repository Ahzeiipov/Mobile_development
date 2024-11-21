import 'package:class_practice/S3%20-%20PRACTICE-%20Statefull%20widgets/EX1/EX1_part1.dart';
import 'package:flutter/material.dart';

class Temperature extends StatefulWidget {
  Temperature({super.key});

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );

  final TextEditingController textController = TextEditingController();
  String input = ' ';

  void convert() {
    double cel = double.tryParse(textController.text) ?? 0.0;
    double f = (cel * 9 / 5) + 32;
    setState(() {
      input = f.toStringAsFixed(2);
    });
  }

  final InputDecoration inputDecoration = InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white, width: 1.0),
        borderRadius: BorderRadius.circular(12),
      ),
      hintText: 'Enter a temperature',
      hintStyle: const TextStyle(color: Colors.white));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.thermostat_outlined,
            size: 120,
            color: Colors.white,
          ),
          const Center(
            child: Text(
              "Converter",
              style: TextStyle(color: Colors.white, fontSize: 45),
            ),
          ),
          const SizedBox(height: 50),
          const Text("Temperature in Degrees:"),
          const SizedBox(height: 10),
          TextField(
              decoration: inputDecoration,
              controller: textController,
              style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 10),
          ElevatedButton(onPressed: convert, child: Text('Convert')),
          const SizedBox(height: 30),
          const Text("Temperature in Fahrenheit:"),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: textDecoration,
            child: Text(
              input.isNotEmpty ? '$input  °F' : ' ',
            ),
          ),
        ],
      )),
    );
  }
}
