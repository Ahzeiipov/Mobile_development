import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      padding: const EdgeInsets.all(200),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: const BorderRadius.all(Radius.circular(50)),
            ),
            child: const Center(
              child: Text(
                'OOP',
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue[300],
              borderRadius: const BorderRadius.all(Radius.circular(50)),
            ),
            child: const Center(
              child: Text(
                'DART',
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: <Color>[
                Colors.blue.shade300,
                Colors.blue.shade900,
              ]),
              // color: Colors.blue[600],
              borderRadius: const BorderRadius.all(Radius.circular(50)),
            ),
            child: const Center(
              child: Text(
                'FLUTTER',
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          )
        ],
      ),
    ),
  ));
}
