import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: ImageChange(),
  ));
}

class ImageChange extends StatefulWidget {
  const ImageChange({super.key});

  @override
  State<ImageChange> createState() => _ImageChangeState();
}

class _ImageChangeState extends State<ImageChange> {
  final List<String> images = [
    'assets/image/image1.jpg',
    'assets/image/image2.jpg',
    'assets/image/image3.jpg',
  ];

  int currentIndex = 0;

  void exchange(int direction) {
    setState(() {
      currentIndex = (currentIndex + direction) % images.length;

      if (currentIndex < 0) {
        currentIndex = images.length - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image View'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: () {
              exchange(-1); // Go to the previous image
            },
            icon: const Icon(
              Icons.chevron_left,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {
              exchange(1); // Go to the next image
            },
            icon: const Icon(
              Icons.chevron_right,
              size: 30,
            ),
          ),
          const Padding(padding: EdgeInsets.only(left: 20)),
        ],
      ),
      body: Center(
        child: Image.asset(
          images[currentIndex],
          fit: BoxFit.cover,
          width: 10000,
        ),
      ),
    );
  }
}
