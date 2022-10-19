import 'package:flutter/material.dart';
import '../../../../widget/custome_button.dart';
import '../Controller/cubit.dart';


class SignInButton extends StatelessWidget {
  const SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomeButton(
      width: 200,
      height: 50,
      fontSize: 20,
      text: 'sign in',
      pressed: () async {
        if (LoginCubit.of(context).formKey.currentState!.validate()) {
          await LoginCubit.of(context).login(
              email: LoginCubit.of(context).emailController.text,
              password: LoginCubit.of(context).passwordController.text);
        }
      },
    );
  }
}
