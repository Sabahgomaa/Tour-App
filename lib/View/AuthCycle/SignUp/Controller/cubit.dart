import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tour_app/View/AuthCycle/SignUp/Controller/states.dart';
import '../../../../Core/cache_helper.dart';
import '../../../../Core/dio_helper.dart';
import '../../../../const/end_point.dart';
import '../../Model/cities_model.dart';
import '../../Model/countries_model.dart';
import '../../Model/model.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit of(context) => BlocProvider.of(context);

  //============================================================================
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullOfficelNameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController jopTitleController = TextEditingController();
  TextEditingController barthDayController = TextEditingController();

//==============================================================================
  UserModel? user;
  CitiesModel? cityModel;
  CountriesModel? countryModel;
  String? countryDropDownValue;
  String? cityDropDownValue;
  File? profilePicture;
  File? passportPicture;
  final formKey = GlobalKey<FormState>();

//==============================================================================
  Future<void> userRegister({
    required String email,
    required String password,
    required String fullOfficelName,
    required String confirmPassword,
    required String phoneNumber,
    required String jopTitle,
    required String barthDay,
    required String countryId,
    required String cityId,
  }) async {
    if (!formKey.currentState!.validate()) return;
    emit(RegisterLoadingState());
    final responce = await DioHelper.postData(url: register, data: {
      'email': email,
      'password': password,
      'name': fullOfficelName,
      'date_of_birth': barthDay,
      'job_title': jopTitle,
      'confirm_password': confirmPassword,
      'phone': phoneNumber,
      'image': profilePicture!.path.split("/").last,
      'passport': passportPicture!.path.split("/").last,
      'country_id': countryId,
      'city_id': cityId,
    });
    try {
      // final data = responce.data;
      user = UserModel.fromJson(responce.data);
      if (user!.success!) {
        CashHelper.cacheUserModel(userModel: user!);
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

      emit(RegisterSuccessState(user!));
    } catch (e, s) {
      if (kDebugMode) {
        print(e.toString());
      }
      if (kDebugMode) {
        print(s);
      }
      emit(RegisterErrorState(e.toString()));
    }
  }

  //============================================================================
  Future<void> pickProfilePicture() async {
    final pickFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickFile == null) return;
    profilePicture = File(pickFile.path);
    // String base64= base64Encode(profilePicture!.readAsBytesSync());
    // if (kDebugMode) {
    //   print(base64);
    // }
    // if (kDebugMode) {
    //   print(profilePicture);
    // }
    // String profilePictureName = profilePicture!.path.split("/").last;
    // if (kDebugMode) {
    //   print(profilePictureName);
    // }
    emit(ProfilePictureInit());
  }

  Future<void> pickPassportPicture() async {
    final pickFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickFile == null) return;
    passportPicture = File(pickFile.path);
    // String base64= base64Encode(profilePicture!.readAsBytesSync());
    // if (kDebugMode) {
    //   print(base64);
    // }
    // if (kDebugMode) {
    //   print(profilePicture);
    // }
    // String profilePictureName = profilePicture!.path.split("/").last;
    // if (kDebugMode) {
    //   print(profilePictureName);
    // }
    emit(PassportPictureInit());
  }

//==============================================================================
  Future<void> getCountries() async {
    emit(GetCountryLoading());
    try {
      final res = await DioHelper.getData(url: countries);
      if (kDebugMode) {
        print(res.data);
      }
      countryModel = CountriesModel.fromJson(res.data);

      if (kDebugMode) {
        print(countryModel!.data!);
        print(CashHelper.getToken);
      }
      emit(GetCountrySuccess(countryModel: countryModel!));
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
      }
      if (kDebugMode) {
        print('*' * 8);
        print(CashHelper.getToken);
      }
      if (kDebugMode) {
        print(s);
      }
    }
  }

  changeCountryDropDown({required String? value}) {
    countryDropDownValue = value;
    emit(ChangeCountryDropDownState());
  }

  //============================================================================
  Future<void> getCitiesById({int? cityId}) async {
    emit(GetCityLoading());
    try {
      final res = await DioHelper.getData(url: cities + cityId.toString());
      if (kDebugMode) {
        print(res.data);
      }
      cityModel = CitiesModel.fromJson(res.data);

      if (kDebugMode) {
        print(cityModel!.data!);
        print(CashHelper.getToken);
      }
      emit(GetCitySuccess(cityModel: cityModel!));
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
      }
      if (kDebugMode) {
        print('*' * 8);
        print(CashHelper.getToken);
      }
      if (kDebugMode) {
        print(s);
      }
    }
  }

  changeCityDropDown({required String? value}) {
    cityDropDownValue = value;
    emit(ChangeCityDropDownState());
  }
}
