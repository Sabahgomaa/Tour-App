import 'package:flutter/material.dart';

import '../const/color.dart';


// ignore: must_be_immutable
class CustomeButton extends StatelessWidget {
  final double width;
  final double fontSize;
  final double height;
  final double radius;
  final String? text;
  final Function() pressed;
  final bool? isUpperCase;
  final Color? textColor;
  final Color? buttonColor;
  TextDecoration? decoration;
  TextDirection? textDirection;
  String? fontFamily;

  // ignore: use_key_in_widget_constructors
  CustomeButton(
      {this.text,
        required this.pressed,
        this.isUpperCase,
        this.buttonColor = Colors.black,
        this.textColor = Colors.black,
        this.decoration,
        required this.width,
        required this.height,
        this.radius = 25.0,
        this.fontFamily,
        this.textDirection,
        required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: width,
        height: height,
        child: MaterialButton(
          onPressed: pressed,
          child: Center(
            child: Text(text!.toUpperCase(),
                textDirection: textDirection ?? TextDirection.ltr,
                // isUpperCase ? text.toUpperCase() : text,
                style: TextStyle(
                    color: textColor,
                    fontSize: fontSize,
                    decoration: decoration,
                    fontFamily: fontFamily ?? "Staatliches")),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: buttonColor,
          border: Border.all(width: 3, color: Dahab),
        ),
      ),
    ]);
  }
}
