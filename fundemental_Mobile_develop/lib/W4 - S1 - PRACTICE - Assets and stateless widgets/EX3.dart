
import 'package:flutter/material.dart';

enum IconPosition { left, right }

enum ButtonType {
  primary(
    title: 'Submit',
    icon: Icons.check,
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
  ),
  secondary(
    title: 'Time',
    icon: Icons.access_time,
    backgroundColor: Colors.green,
    foregroundColor: Colors.white,
  ),
  disabled(
    title: 'Account',
    icon: Icons.account_tree,
    backgroundColor: Colors.grey,
    foregroundColor: Colors.black54, // Color for text when disabled
  );

  final String title;
  final IconData icon; // Change to IconData
  final Color backgroundColor;
  final Color foregroundColor;

  const ButtonType({
    required this.title,
    required this.icon,
    required this.backgroundColor,
    required this.foregroundColor,
  });
}

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              buttonType: ButtonType.primary,
              iconPosition: IconPosition.left,
            ),
            SizedBox(height: 16), // Space between buttons
            CustomButton(
              buttonType: ButtonType.secondary,
              iconPosition: IconPosition.right,
            ),
            SizedBox(height: 16), // Space between buttons
            CustomButton(
              buttonType: ButtonType.disabled,
              iconPosition: IconPosition.left,
            ),
          ],
        ),
      ),
    ),
  ));
}

class CustomButton extends StatelessWidget {
  final ButtonType buttonType;
  final IconPosition iconPosition;

  const CustomButton({
    Key? key,
    required this.buttonType,
    this.iconPosition = IconPosition.left, // Default to left
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: buttonType == ButtonType.disabled
          ? null
          : () {
              // Handle button press
            },
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonType.backgroundColor,
        foregroundColor: buttonType.foregroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconPosition == IconPosition.left) ...[
            Icon(buttonType.icon),
            SizedBox(width: 8),
          ],
          Text(buttonType.title),
          if (iconPosition == IconPosition.right) ...[
            SizedBox(width: 8),
            Icon(buttonType.icon),
          ],
        ],
      ),
    );
  }
}
