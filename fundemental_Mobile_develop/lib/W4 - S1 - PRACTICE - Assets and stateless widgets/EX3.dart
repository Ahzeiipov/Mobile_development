import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

enum ButtonType {
  submit(
    icon: Icon(Icons.check),
    title: 'Submit',
  ),
  time(
    title: 'Time',
    icon: Icon(Icons.access_time),
  ),
  account(
    title: 'Account',
    icon: Icon(Icons.account_tree),
  );

  final String title;
  final Icon icon;
  const ButtonType({required this.title, required this.icon});
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        // Center the Column in the body
        child: Column(
          mainAxisSize: MainAxisSize.min, // Adjusts to the size of its children
          children: [
            ElevatedButton(
              onPressed: () {
                // Define the action here
              },
              child: Row(
                mainAxisSize: MainAxisSize.min, // Minimize the size of the Row
                children: [
                  Icon(Icons.check),
                  SizedBox(width: 8), // Add space between the icon and text
                  Text('Submit'),
                ],
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                
              ),
            ),
          ],
        ),
      ),
    ),
  ));
}
