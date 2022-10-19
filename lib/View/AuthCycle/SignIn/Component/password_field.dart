import 'package:flutter/material.dart';

import '../../../../widget/custome_textformfield.dart';


// ignore: must_be_immutable
class PasswordField extends StatelessWidget {
  TextEditingController controller;
  PasswordField({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomeTextFormField(
      label: "password",
      controller: controller,
      type: TextInputType.visiblePassword,
      validate: (password) {
        if (password!.isEmpty) {
          return 'Field is empty';
        } else if (password.length < 6) {
          return "Password must be atleast 8 characters long";
        }
        return null;
      },
    );
  }
}