import 'package:flutter/material.dart';
import '../../../../Core/router.dart';
import '../../../../widget/custome_button.dart';
import '../../ForgetPassword/view.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomeButton(
        width: 240,
        height: 50,
        fontSize: 15,
        text: 'forget your password',
        pressed: () {
          MagicRouter.navigateTo(const ForgetPasswordView());
        });
  }
}

