import 'package:flutter/material.dart';
import '../../../../widget/custome_textformfield.dart';
import '../Controller/cubit.dart';



class RegisterInfo extends StatelessWidget {
  const RegisterInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit  = RegisterCubit.of(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomeTextFormField(
            label: 'e-mail',
            controller:cubit.emailController,
            radius: 10,
            height: 30,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomeTextFormField(
            label: 'password',
            controller: cubit.passwordController,
            radius: 10,
            height: 30,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomeTextFormField(
            label: 'confirm password',
            controller: cubit.confirmPasswordController,
            radius: 10,
            height: 30,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomeTextFormField(
            label: 'phone number',
            controller: cubit.phoneNumberController,
            radius: 10,
            height: 30,
          ),

        ],
      ),
    );
  }
}
