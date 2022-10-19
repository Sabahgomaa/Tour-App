import 'package:flutter/material.dart';
import 'package:tour_app/const/color.dart';

// ignore: must_be_immutable
class CustomeTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? type;
  final String? label;
  final IconData? suffix;
  final Function(String)? onSubmit;
  final String? Function(String?)? validate;
  final Function(String)? onChange;
  final Function()? suffixPressed;
  final IconData? prefix;
  CrossAxisAlignment? crossAxisAlignment;
  bool isPassword = false;
  double? width = double.infinity;
  double? height = 0;
  double? fontSize;
  TextDecoration? decoration;
  double radius = 0;
  TextStyle? style;
  TextDirection? textDirection;

  CustomeTextFormField({
    Key? key,
    this.label,
    required this.controller,
    this.textDirection,
    this.suffix,
    this.decoration,
    this.prefix,
    this.onSubmit,
    this.onChange,
    this.suffixPressed,
    this.validate,
    this.isPassword = false,
    this.type,
    this.width,
    this.height,
    this.radius = 0,
    this.fontSize = 15,
    this.style,
    this.crossAxisAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
        //textDirection: textDirection?? TextDirection.ltr,
        children: [
          Row(
            children: [
              Text(
                label!.toUpperCase(),
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: fontSize,
                  decoration: decoration,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Staatliches",
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .01),
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              border: Border.all(width: 3, color: Dahab),
              color: Colors.white,
              borderRadius: BorderRadius.circular(radius),
            ),
            child:
            TextFormField(
              // expands: true,
              //  maxLines: null,
              // minLines: 2,
              autocorrect: false,
              controller: controller,
              keyboardType:TextInputType.multiline,
              textDirection: textDirection ?? TextDirection.ltr,
              // style: const TextStyle(color: Colors.black,),
              obscureText: isPassword,
              onFieldSubmitted: onSubmit,
              onChanged: onChange,
              validator: validate,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                //labelText: label.toUpperCase(),
                // hoverColor: Colors.brown,hintMaxLines: 4,
                // constraints: BoxConstraints(maxHeight: 10, maxWidth: 10),
                counterStyle: TextStyle(color: Colors.black),
                errorMaxLines: 5,
                helperMaxLines: 4,
                fillColor: Colors.black,
                alignLabelWithHint: true,
                border: OutlineInputBorder(borderSide: BorderSide.none),
                // contentPadding: EdgeInsets.fromLTRB(12, 24, 12, 24),
                //prefixIcon: Icon(prefix),
                // suffixIcon: suffix != null
                //     ? IconButton(
                //   onPressed: suffixPressed,
                //   icon: Icon(suffix),
                // )
                //     : null,
              ),
            ),
          ),
        ]);
  }
}
