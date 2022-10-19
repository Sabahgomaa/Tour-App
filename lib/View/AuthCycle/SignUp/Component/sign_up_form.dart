import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_app/View/AuthCycle/SignUp/Component/register_info.dart';
import 'package:tour_app/View/AuthCycle/SignUp/Component/user_info.dart';
import '../../../Main/ExploreEgypt/ExploreEgyptCategory/View.dart';
import '../../SignIn/Component/signin_button.dart';
import '../Controller/cubit.dart';
import '../Controller/states.dart';
import 'images.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RegisterCubit()..getCountries(),
        child: BlocConsumer<RegisterCubit, RegisterStates>(
            listener: (context, state) {
              if (state is RegisterSuccessState) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const ExploreEgyptView(),
                ));
                if (state.registerModel.message != null) {
                  if (kDebugMode) {
                    print(state.registerModel.message);
                  }
                  if (kDebugMode) {
                    print(state.registerModel.data!.token);
                  }
                } else {
                  if (kDebugMode) {
                    print(state.registerModel.message);
                  }
                }
              } else if (state is RegisterErrorState) {
                if (kDebugMode) {
                  print(state.error);
                }
              }
            },
            builder: (context, state) =>
                Form(
                  child: SingleChildScrollView(
                    child: Column(
                      children: const [
                        UserInfo(),
                        RegisterInfo(),
                        SizedBox(
                          height: 10,
                        ),
                        ImageUsers(),
                        SizedBox(
                          height: 10,
                        ),
                        SignInButton(),

                      ],
                    ),
                  ),
                )));
  }
}
