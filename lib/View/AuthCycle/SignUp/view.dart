import 'package:flutter/material.dart';
import '../BackGroundClass/background_class.dart';
import 'Component/sign_up_form.dart';
class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BacgroundClass(
      screen: const Padding(
          padding: EdgeInsets.all(50.0),
          child:  SignUpForm()),

    );
  }
}
