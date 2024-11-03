import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      padding: const EdgeInsets.all(160),
      child: const Column(
        children: [
          CustomCard(
            text: 'OOP',
            start: Colors.lightBlue,
            end: Colors.blue,
          ),
          CustomCard(
              text: 'DART',
              start: Color.fromARGB(255, 230, 108, 99),
              end: Color.fromARGB(255, 240, 33, 18)),
          CustomCard(
              text: 'FLUTTER',
              start: Color.fromARGB(255, 237, 225, 114),
              end: Color.fromARGB(255, 253, 229, 14)),
        ],
      ),
    ),
  ));
}

class CustomCard extends StatelessWidget {
  final String text;
  final Color start;
  final Color end;
  const CustomCard(
      {super.key, required this.text, required this.start, required this.end});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [start, end],
        ),
        borderRadius: const BorderRadius.all(Radius.circular(50)),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
