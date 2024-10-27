import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      padding: const EdgeInsets.all(160),
      child: const Column(
        children: [
          CustomCard(text: 'OOP', color: Color.fromARGB(255, 77, 199, 255)),
          CustomCard(text: 'DART', color: Color.fromARGB(255, 76, 174, 255)),
          CustomCard(text: 'FLUTTER', color: Color.fromARGB(255, 15, 138, 239)),
        ],
      ),
    ),
  ));
}

class CustomCard extends StatelessWidget {
  final String text;
  final Color color;
  const CustomCard({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
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
