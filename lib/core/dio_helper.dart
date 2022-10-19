import 'package:dio/dio.dart';

import 'cache_helper.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'cashe_helper.dart';

class DioHelper {
  static  Dio? dio;
  static const _baseUrl = 'https://guarded-lake-20708.herokuapp.com/api/v1/';

  static bool? isEnglish = false;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://guarded-lake-20708.herokuapp.com/api/v1/',
        headers: {
          'Content-Type': 'application/json',
          'Accept-Language': isEnglish == true ? 'en' : 'ar',
        },
        // isEn(MagicRouter.currentContext)?'en':
        receiveDataWhenStatusError: true,
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        }));
  }

  static Future<Response> getData({
    required url,
    Map<String, dynamic>? qurey,
  }) async {
    dio!.options.headers["Authorization"] = "Bearer ${CashHelper.getToken}";

    return await dio!.get(url, queryParameters: qurey);
  }

  static Dio dioSingleton = Dio()..options.baseUrl = _baseUrl;
  static Future<Response<dynamic>>? get(String path) {
    if (CashHelper.isLogged) {
      dioSingleton.options.headers = {
        'Authorization': 'Bearer ${CashHelper.getToken}'
      };
    }
    final response = dioSingleton.get(path);
    dioSingleton.options.headers = null;
    return response;
  }

  static Future<Response> postData({
    required String url,
    FormData? formData,
    Map<String, dynamic>? data,
    // Map<String, dynamic>? query,
  }) async {
    dio!.options.headers["Authorization"] = "Bearer ${CashHelper.getToken}";

    return dio!.post(
      url,
      //  queryParameters: query,
      data: formData ?? data,
    );
  }

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'ar',
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };

    return dio!.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<void>? launchURL(url) async {
    // if (!await launch(url)) throw 'Could not launch $url';
  }
}