import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomeTextButton extends StatelessWidget {
  Function() function;
  String text;
  double fontSize;
  Color fontcolor;
  CustomeTextButton(
      {Key? key,
        required this.text,
        required this.function,
        required this.fontSize,
        this.fontcolor= Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          color: fontcolor,
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
          //fontFamily: "Staatliches",
        ),
      ),
    );
  }
}
