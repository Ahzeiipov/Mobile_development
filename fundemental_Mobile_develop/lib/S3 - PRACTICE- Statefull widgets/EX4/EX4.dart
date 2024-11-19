import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      // backgroundColor: const Color.fromARGB(255, 131, 207, 134),
      body: Container(
        child: Scorebar(),
      ),
    ),
  ));
}

class Scorebar extends StatefulWidget {
  const Scorebar({
    super.key,
  });

  @override
  State<Scorebar> createState() => _ScorebarState();
}

class _ScorebarState extends State<Scorebar> {
  double score = 0.0;
  void incremen() {
    setState(() {
      score = (score + 10) % 101;
    });
  }

  void decrement() {
    setState(() {
      score = (score - 10) < 0 ? 0 : score - 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          child: const Text(
            'My score Dart',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  decrement();
                },
                icon: Icon(Icons.remove)),
            SizedBox(
              width: 100,
            ),
            IconButton(
                onPressed: () {
                  incremen();
                },
                icon: Icon(Icons.add))
          ],
        ),
        Stack(
          // alignment: Alignment.center,
          children: [
            Container(
              width: 250,
              height: 30,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            Expanded(
                child: Container(
              width: score / 100 * 300,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ))
          ],
        )
      ],
    );
  }
}

