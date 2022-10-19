import 'package:flutter/material.dart';
import '../../../../widget/custome_button.dart';
import '../controller/cubit.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = RegisterCubit.of(context);
    return CustomeButton(
      width: 200,
      height: 50,
      fontSize: 20,
      text: 'sign in',
      pressed: () async {
        if (cubit.formKey.currentState!.validate()) {
          await cubit.userRegister(
            email: cubit.emailController.text,
            password: cubit.passwordController.text,
            barthDay: cubit.barthDayController.text,
            countryId: cubit.countryDropDownValue.toString(),
            confirmPassword: cubit.confirmPasswordController.text,
            jopTitle: cubit.jopTitleController.text,
            fullOfficelName: cubit.fullOfficelNameController.text,
            phoneNumber: cubit.phoneNumberController.text,
            cityId: cubit.cityDropDownValue.toString(),
          );
        }
      },
    );
  }
}
