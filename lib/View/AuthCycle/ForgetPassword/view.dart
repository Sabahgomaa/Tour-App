import 'package:flutter/material.dart';
import 'package:tour_app/View/AuthCycle/BackGroundClass/background_class.dart';
import 'Component/forget_password.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BacgroundClass(
        screen: const Padding(
          padding: EdgeInsets.all(50.0),
          child: ForgetPassword(),
        ),
      ),
    );
  }
}