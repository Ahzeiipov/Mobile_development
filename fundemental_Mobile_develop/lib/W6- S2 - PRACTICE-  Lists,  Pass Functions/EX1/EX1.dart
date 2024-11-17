import 'package:flutter/material.dart';

List<String> colors = ["red", "blue", "green"];

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Label("Method 1: Loop in Array", bold: true),
            // TODO
            ...usingLoop(),
            SizedBox(height: 20),
            Label("Method 2: Map", bold: true),
            ...colors.map((color) => Text(color)).toList(),
            // TODO
            SizedBox(height: 20),
            Label("Method 23: Dedicated Function", bold: true),
            ...usingDecated(),
            // TODO
          ],
        ),
      ),
    ),
  ));
}

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontWeight: (bold ? FontWeight.bold : FontWeight.normal)),
    );
  }
}

List<Widget> usingLoop() {
  List<Widget> colorWidgets = [];
  for (var color in colors) {
    colorWidgets.add(Text(color)); // Create a Text widget for each color
  }
  return colorWidgets;
}

List<Widget> usingDecated() {
  return colors.map((color) => Text(color)).toList();
}
