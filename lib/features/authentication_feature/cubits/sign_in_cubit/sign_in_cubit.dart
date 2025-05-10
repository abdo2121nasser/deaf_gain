import 'package:bloc/bloc.dart';
import 'package:deaf_gain/core/services/dio_service.dart';
import 'package:deaf_gain/core/services/failure_service.dart';
import 'package:deaf_gain/core/utils/strings/strings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  static SignInCubit get(context) => BlocProvider.of(context);

  signIn() async {
    try {
      emit(SignInLoadingState());
      Response response =
          await DioHelper.postData(endPoint: '', map: {});
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        emit(SignInSuccessState());
      }
    } catch (error) {
      if (error is DioException) {
        emit(SignInErrorState(error: ServerFailure.fromServer(error)));
      } else {
        emit(SignInErrorState(error: ServerFailure(devMessage: error.toString(),
            userMessage:kUnKnownProblemMessage
        )));
      }
    }
  }
}
