import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_app/View/AuthCycle/SignIn/Component/password_field.dart';
import 'package:tour_app/View/AuthCycle/SignIn/Component/sign_up_section.dart';
import 'package:tour_app/View/AuthCycle/SignIn/Component/signin_button.dart';
import '../../../Main/ExploreEgypt/ExploreEgyptCategory/View.dart';
import '../Controller/cubit.dart';
import '../Controller/states.dart';
import 'email_field.dart';
import 'forget_password_button.dart';

class FormSignIn extends StatelessWidget {
  const FormSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const ExploreEgyptView(),
            ));
            if (state.loginModel.message != null) {
              if (kDebugMode) {
                print(state.loginModel.message);
              }
              if (kDebugMode) {
                print(state.loginModel.data!.token);
              }
            } else {
              if (kDebugMode) {
                print(state.loginModel.message);
              }
            }
          } else if (state is LoginErrorState) {
            if (kDebugMode) {
              print(state.error);
            }
          }
        },
        builder: (context, state) => Form(
          key: LoginCubit.of(context).formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                EmailField(
                  controller: LoginCubit.of(context).emailController,
                ),
                const SizedBox(
                  height: 20,
                ),
                PasswordField(
                  controller: LoginCubit.of(context).passwordController,
                ),
                const SizedBox(
                  height: 30,
                ),
                const SignInButton(),
                const SizedBox(
                  height: 10,
                ),
                const ForgetPasswordButton(),
                const SizedBox(
                  height: 10,
                ),
                const SignUpSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
