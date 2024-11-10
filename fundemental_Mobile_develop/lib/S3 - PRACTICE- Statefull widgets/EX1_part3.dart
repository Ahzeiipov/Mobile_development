import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Stateful Button Example')),
      body: ButtonColumn(),
    ),
  ));
}

class ButtonColumn extends StatefulWidget {
  @override
  State<ButtonColumn> createState() => _ButtonColumnState();
}

class _ButtonColumnState extends State<ButtonColumn> {
  List<bool> selectedStates = [false, false, false];

  void toggleButton(int index) {
    setState(() {
      selectedStates[index] = !selectedStates[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(3, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: CustomButton(
              isSelected: selectedStates[index],
              onPressed: () => toggleButton(index),
            ),
          );
        }),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.blue[500] : Colors.blue[50],
        ),
        child: Center(
          child: Text(
            isSelected ? "Selected" : "Not Selected",
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}