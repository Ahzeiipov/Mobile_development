import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final VoidCallback onStart;
  const WelcomeScreen({super.key, required this.onStart});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const ImageIcon(
          AssetImage('assets/image/quiz-logo.png'),
          size: 300,
        ),
        const SizedBox(
          height: 20,
        ),
        Title(
            color: Colors.white,
            child: const Text(
              'Crazy Quiz',
              style: TextStyle(
                  fontSize: 60,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )),
        const SizedBox(
          height: 20,
        ),
        Padding(
            padding: const EdgeInsets.only(left: 150, right: 150),
            child: ElevatedButton(
                onPressed: onStart,
                child: const Row(
                  children: [
                     SizedBox(
                      width: 20,
                    ),
                    Icon(Icons.arrow_right_alt_outlined),
                     SizedBox(
                      width: 30,
                    ),
                    Text('Start quiz'),
                  ],
                ))),
      ],
    );
  }
}
