import 'dart:math';
import 'package:flutter/material.dart';
import 'package:interview/const/custom_color.dart';
import 'package:interview/screens/key_pad/key_pad.dart';

class CodeUnlock extends StatefulWidget {
  const CodeUnlock({Key? key}) : super(key: key);

  @override
  CodeUnlockState createState() => CodeUnlockState();
}

class CodeUnlockState extends State<CodeUnlock> {
  TextEditingController pinController = TextEditingController();
  bool isWrongPin = false;
  String displayCode = "1234";
  bool showEnterPasswordMessage = true; // Track whether to show the message

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Unlocker',
          style: TextStyle(color: kwhite),
        ),
        backgroundColor: mainColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter password to unlock the app',
              style: TextStyle(fontSize: 20),
            ),
            //If the entered password is wrong this message will appear
            if (isWrongPin)
              const Text(
                'Wrong password, please try again!',
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < 4; i++) _buildDigitBox(i),
                ],
              ),
            ),
            KeyPad(
              pinController: pinController,
              isPinLogin: false,
              onChange: (String pin) {
                setState(() {
                  isWrongPin = false;
                  showEnterPasswordMessage =
                      false; // Hide the message on pin entry
                });
              },
              onSubmit: (String pin) {
                if (pin.length != 4) {
                  setState(() {
                    isWrongPin = true;
                    showEnterPasswordMessage =
                        false; // Hide the message on error
                  });
                  return;
                } else {
                  pinController.text = pin;

                  if (pinController.text == displayCode) {
                    setState(() {
                      displayCode = getNextCode();
                      pinController.text = ''; // Clear the entered PIN
                      showEnterPasswordMessage =
                          true; // Show the message again for next entry
                    });
                  } else {
                    setState(() {
                      isWrongPin = true;
                      showEnterPasswordMessage =
                          false; // Hide the message on error
                    });
                  }
                }
              },
              buttonSize: 60,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDigitBox(int index) {
    return GestureDetector(
      onTap: () {
        if (pinController.text.length > index) {
          pinController.text = pinController.text.substring(0, index) +
              pinController.text.substring(index + 1);
          setState(() {});
        }
      },
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: isWrongPin ? Colors.red : mainColor, // Border color
          ),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: () {},
          child: Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.transparent,
            ),
            child: Center(
              child: Text(
                pinController.text.length > index
                    ? pinController.text[index]
                    : '',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String getNextCode() {
    var rng = Random();
    var code = (rng.nextInt(9000) + 1000).toString();
    // ignore: avoid_print
    print('Random No is: $code');
    return code;
  }
}
