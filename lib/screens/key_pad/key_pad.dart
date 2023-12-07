import 'package:flutter/material.dart';
import 'package:interview/screens/key_pad/widgets/icon_button_widget.dart';
import 'package:interview/screens/key_pad/widgets/number_button.dart';

//This is the number pad ui for the app
// ignore: must_be_immutable
class KeyPad extends StatelessWidget {
  double buttonSize = 60.0;
  final TextEditingController pinController;
  final Function onChange;
  final Function onSubmit;
  final bool isPinLogin;

  KeyPad({
    Key? key,
    required this.buttonSize,
    required this.pinController,
    required this.onChange,
    required this.onSubmit,
    required this.isPinLogin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //The number button widget is calling from [1-3] for the first row of the key pad
              for (int i = 1; i <= 3; i++)
                NumberButton(
                  buttonSize: buttonSize,
                  buttonText: '$i',
                  pinController: pinController,
                  onChange: onChange,
                ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //The number button widget is calling from [4-6] for the second row of the key pad
              for (int i = 4; i <= 6; i++)
                NumberButton(
                  buttonSize: buttonSize,
                  buttonText: '$i',
                  pinController: pinController,
                  onChange: onChange,
                ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //The number button widget is calling from [7-9] for the third row of the key pad
              for (int i = 7; i <= 9; i++)
                NumberButton(
                  buttonSize: buttonSize,
                  buttonText: '$i',
                  pinController: pinController,
                  onChange: onChange,
                ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //The icon button is being called for the backspace [clear] the form field
              IconButtonWidget(
                buttonSize: buttonSize,
                icon: Icons.backspace,
                function: () {
                  if (pinController.text.isNotEmpty) {
                    pinController.text = pinController.text
                        .substring(0, pinController.text.length - 1);
                    onChange(pinController.text);
                  }
                },
              ),
              //The number button 0 in the middle  of the icon buttons
              NumberButton(
                buttonSize: buttonSize,
                buttonText: '0',
                pinController: pinController,
                onChange: onChange,
              ),
              !isPinLogin
                  ? IconButtonWidget(
                      buttonSize: buttonSize,
                      icon: Icons.check_circle,
                      function: () {
                        onSubmit(pinController.text);
                      },
                    )
                  : Container(
                      width: buttonSize,
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
