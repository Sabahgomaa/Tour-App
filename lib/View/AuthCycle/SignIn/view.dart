import 'package:flutter/material.dart';

import '../BackGroundClass/background_class.dart';
import 'Component/form_sign_in.dart';




class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BacgroundClass(
        screen: const Padding(
          padding: EdgeInsets.all(50.0),
          child: FormSignIn(),
        ),
      ),

    );
  }
}