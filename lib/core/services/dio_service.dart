import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init({required String baseUrl}) {
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio!.options.headers = {
      'Authorization': 'Bearer $token',
    };
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData(
      {required String url,
      Map<String, dynamic>? query,
      required FormData data,
      String? token,
      String? contentType


      }) {
    dio!.options.headers = {
      'content-type':'application/json',
    };
    dio!.options.contentType = contentType;

    return dio!.post(url, queryParameters: query, data: data);
  }
}
