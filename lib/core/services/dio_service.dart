import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'http://127.0.0.1:5256/api/',
      // adb reverse tcp:5256 tcp:5256
      //dotnet run --urls "http://0.0.0.0:5256"
      receiveDataWhenStatusError: true,

    ));
  }

  static Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio!.options.headers = {
      'Authorization': 'Bearer $token',
    };
    return await dio!.get(endPoint, queryParameters: query);
  }

  static Future<Response> postData(
      {required String endPoint,
      Map<String, dynamic>? query,
       Map<String,dynamic>? map,
        FormData? data,
      String? token,
      String? contentType}) {
    dio!.options.headers = {
      'content-type': 'application/json',
    };
    dio!.options.contentType = contentType;

    return dio!.post(endPoint, queryParameters: query, data: data?? map);
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {

    dio!.options.headers = {
      'Authorization':'Bearer $token',
    };
    return dio!.put(url, queryParameters: query, data: data);

  }

}
