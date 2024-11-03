import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      color: Colors.blue,
      padding: const EdgeInsets.all(40),
      margin: const EdgeInsets.fromLTRB(300, 50, 300, 50),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color.fromARGB(255, 10, 125, 219),
        ),
        child: const Center(
          child: Text('CADT STUDENTS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                decoration: TextDecoration.none,
              )),
        ),
      ),
    ),
  ));
}
