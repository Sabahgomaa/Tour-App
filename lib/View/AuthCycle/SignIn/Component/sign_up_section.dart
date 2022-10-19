import 'package:flutter/material.dart';

import '../../../../widget/custome_button.dart';
import '../../../../widget/custome_text_button.dart';




class SignUpSection extends StatelessWidget {
  const SignUpSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomeTextButton(
            function: () {},
            text: 'you don’t have an account',
            fontSize: 15),
        CustomeButton(
            width: 240,
            height: 50,
            fontSize: 15,
            text: 'Sign up',
            pressed: () {}),
        const SizedBox(
          height: 10,
        ),
        CustomeTextButton(
            function: () {

            },
            text: 'after registering you can join as a partner',
            fontSize: 10),
      ],
    );
  }
}
