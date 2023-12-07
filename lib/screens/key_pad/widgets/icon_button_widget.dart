import 'package:flutter/material.dart';
import 'package:interview/const/custom_color.dart';

//This is the button for the validation of the password
//and the backspace in the form field of the password
class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    super.key,
    required this.buttonSize,
    required this.icon,
    required this.function,
  });

  final double buttonSize;
  final IconData icon;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        height: buttonSize,
        width: buttonSize,
        decoration: BoxDecoration(
          color: iconButtonColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            icon,
            size: 30,
            color: kwhite,
          ),
        ),
      ),
    );
  }
}
