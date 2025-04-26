import 'package:dio/dio.dart';

abstract class Failure {
  final String devMessage;
  final String userMessage;
  final String? statusCode;

  Failure({
    required this.devMessage,
    required this.userMessage,
    this.statusCode,
  });
}

class ServerFailure extends Failure {
  ServerFailure({
    required super.devMessage,
    required super.userMessage,
    super.statusCode,
  });

  factory ServerFailure.fromServer(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          devMessage: "Connection Timeout",
          userMessage: "انتهت مهلة الاتصال، الرجاء المحاولة مرة أخرى",
        );
      case DioExceptionType.sendTimeout:
        return ServerFailure(
          devMessage: "Send Timeout",
          userMessage: "انتهت مهلة إرسال البيانات، الرجاء المحاولة مرة أخرى",
        );
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          devMessage: "Receive Timeout",
          userMessage: "انتهت مهلة استلام البيانات، الرجاء المحاولة مرة أخرى",
        );
      case DioExceptionType.badCertificate:
        return ServerFailure(
          devMessage: "Bad Certificate",
          userMessage: "خطأ في الشهادة الأمنية، الرجاء المحاولة لاحقًا",
        );
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(
          devMessage: "Request Cancelled",
          userMessage: "تم إلغاء الطلب",
        );
      case DioExceptionType.connectionError:
        return ServerFailure(
          devMessage: "Connection Error",
          userMessage: "تعذر الاتصال بالإنترنت، تحقق من الشبكة",
        );
      case DioExceptionType.unknown:
        if (dioException.message!.contains("SocketException")) {
          return ServerFailure(
            devMessage: "SocketException (No Internet)",
            userMessage: "لا يوجد اتصال بالإنترنت",
          );
        } else {
          return ServerFailure(
            devMessage: "Unknown Error",
            userMessage: "حدث خطأ غير متوقع، الرجاء المحاولة لاحقًا",
          );
        }
      default:
        return ServerFailure(
          devMessage: "Something went wrong",
          userMessage: "حدث خطأ غير متوقع، الرجاء المحاولة لاحقًا",
        );
    }
  }

  factory ServerFailure.fromBadResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 402) {
      return ServerFailure(
        devMessage: response["message"] ?? "Client Error",
        userMessage: "حدث خطأ أثناء معالجة الطلب",
        statusCode: statusCode.toString(),
      );
    } else if (statusCode == 404) {
      return ServerFailure(
        devMessage: "Not found data",
        userMessage: "لم يتم العثور على البيانات المطلوبة",
        statusCode: statusCode.toString(),
      );
    } else if (statusCode == 500) {
      return ServerFailure(
        devMessage: response["message"] ?? "Internal Server Error",
        userMessage: "حدث خطأ في الخادم، الرجاء المحاولة لاحقًا",
        statusCode: statusCode.toString(),
      );
    } else {
      return ServerFailure(
        devMessage: "Oops, try again later",
        userMessage: "حدث خطأ ما، الرجاء المحاولة لاحقًا",
        statusCode: statusCode.toString(),
      );
    }
  }
}
