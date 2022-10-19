import 'dart:async';
import 'package:get_storage/get_storage.dart';

import '../View/AuthCycle/Model/model.dart';


class CashHelper {
  static final GetStorage _box = GetStorage();

  static Future<void> init() async => await GetStorage.init();

  static Future<void> cacheUserInfo({
    required String token,
    required UserModel userModel,
  }) async {
    await _cacheUserToken(token);
    await _cacheUserModel(userModel);
  }

  static Future<void> cacheUserModel({
    required UserModel userModel,
  }) async {
    await _cacheUserModel(userModel);
  }


  static Future<void> _cacheUserModel(UserModel userModel) async =>
      await _box.write('userModel', userModel.toJson());


  static Future<void> _cacheUserToken(String token) async =>
      await _box.write('token', token);

  static UserModel? get getUserInfo {
    UserModel? userModel;
    if (_box.hasData('userModel')) {
      userModel = UserModel.fromJson(_box.read('userModel'));
    }
    return userModel;
  }

  static Future<void> cashValue(
      {required String key, required bool value}) async {
    return await _box.write(key, value);
  }
  // static Future<void> cashLangValue(
  //     {required String lang}) async {
  //   return await _box.write('Accept-Language', lang);
  // }


  static Future<dynamic> readValue({
    required String key,
  }) async {
    return await _box.read(key);
  }

  static bool get isLogged => getUserInfo != null;

  //static bool get rememberMe =>  ;


  static String? get getToken => getUserInfo?.data!.token;

  static User? get getUserData => getUserInfo?.data;

  // static Future<void> cacheSettingsInfo(SettingsModel settingsModel) =>
  //     _box.write('settings', settingsModel.toJson());
  //
  // static SettingsModel? get getSettingsInfo {
  //   SettingsModel? settingsModel;
  //   if (_box.hasData('settings')) {
  //     settingsModel = SettingsModel.fromJson(_box.read('settings'));
  //   }
  //   return settingsModel;
  // }

  static Future<void> removeData({
    required String key,
  }) async {
    return await _box.remove(key);
  }

//   static Future<void> signOut() async {
//     try {
//       final response = await DioHelper.get(SIGNOUT);
//       final data = response!.data as Map<String, dynamic>;
//       showToast(msg: data['message'], state: ToastStates.SUCCESS);
//     } catch (e) {
//       showToast(msg: e.toString(), state: ToastStates.SUCCESS);
//     }
//     await _box.erase();
//     MagicRouter.navigateAndPopAll(const LoginScreen());
//   }
//
//   static Future<void> removeData({
//     required String key,
//   }) async {
//     return await _box.remove(key);
//   }

//   static Future<void> signOut() async {
//     try {
//       final response = await DioHelper.get(SIGNOUT);
//       final data = response!.data as Map<String, dynamic>;
//       showToast(msg: data['message'], state: ToastStates.SUCCESS);
//     } catch (e) {
//       showToast(msg: e.toString(), state: ToastStates.SUCCESS);
//     }
//     await _box.erase();
//     MagicRouter.navigateAndPopAll(const LoginScreen());
//   }
}
