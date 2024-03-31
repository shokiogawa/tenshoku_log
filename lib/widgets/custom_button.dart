import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color buttonColor;
  final Function()? onPressed;
  final double? height;

  const CustomButton(
      {super.key,
        required this.text,
        this.textColor,
        required this.buttonColor, this.onPressed, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              backgroundColor: buttonColor),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(color: textColor ?? Colors.white, fontSize: 15),
          )),
    );
  }
}