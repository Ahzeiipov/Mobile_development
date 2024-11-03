import 'package:flutter/material.dart';
import 'EX2_part3.dart';

enum Product {
  dart(
    title: 'Dart',
    description: 'The best object language',
    image: 'assets/image/dart.png',
  ),
  flutter(
    title: 'Flutter',
    description: 'The best mobile widget library ',
    image: 'assets/image/flutter.png',
  ),
  firebase(
    title: 'Firebase',
    description: 'The best clound Database',
    image: 'assets/image/firebase.png',
  );

  final String title;
  final String description;
  final String image;
  const Product({
    required this.title,
    required this.description,
    required this.image,
  });
}
