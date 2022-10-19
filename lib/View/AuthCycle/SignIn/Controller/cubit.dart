import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_app/View/AuthCycle/SignIn/Controller/states.dart';
import '../../../../Core/cache_helper.dart';
import '../../../../Core/dio_helper.dart';
import '../../../../const/end_point.dart';
import '../../Model/model.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit of(context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UserModel? user;
  final formKey = GlobalKey<FormState>();

  Future<void> login({
    required String email,
    required String password,
  }) async {
    if (!formKey.currentState!.validate()) return;
    emit(LoginLoadingState());
    final responce = await DioHelper.postData(url: logIn, data: {
      'email': email,
      'password': password,
    });
    try {
      // final data = responce.data;
      user = UserModel.fromJson(responce.data);
      if (user!.success!) {
        CashHelper.cacheUserModel(
            userModel: user!);
      }
      if (kDebugMode) {
        print(responce.data);
      }
      if (kDebugMode) {
        print(CashHelper.getUserInfo);
      }
      if (kDebugMode) {
        print(CashHelper.getToken);
      }

      emit(LoginSuccessState(user!));
    } catch (e, s) {
      if (kDebugMode) {
        print(e.toString());
      }
      if (kDebugMode) {
        print(s);
      }
      emit(LoginErrorState(e.toString()));
    }
  }
}
