import 'package:flutter/material.dart';
import 'package:interview/const/custom_color.dart';

//This is the widget for the Number button in the dial pad of the app
//For entering values in the app
class NumberButton extends StatelessWidget {
  final double buttonSize;
  final String buttonText;
  final TextEditingController pinController;
  final Function onChange;

  const NumberButton({
    super.key,
    required this.buttonSize,
    required this.buttonText,
    required this.pinController,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonSize,
      width: buttonSize,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonSize / 2),
          ),
        ),
        onPressed: () {
          if (pinController.text.length <= 3) {
            pinController.text = pinController.text + buttonText;
            onChange(pinController.text);
          }
        },
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
