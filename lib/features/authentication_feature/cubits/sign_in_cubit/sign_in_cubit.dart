import 'package:bloc/bloc.dart';
import 'package:deaf_gain/core/services/dio_service.dart';
import 'package:deaf_gain/core/services/failure_service.dart';
import 'package:deaf_gain/core/utils/strings/end_points.dart';
import 'package:deaf_gain/core/utils/strings/strings.dart';
import 'package:deaf_gain/features/authentication_feature/entities/user_entity.dart';
import 'package:deaf_gain/features/authentication_feature/models/sign_in_model.dart';
import 'package:deaf_gain/features/authentication_feature/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  static SignInCubit get(context) => BlocProvider.of(context);

  signIn({required SignInModel signInModel}) async {
    try {
      emit(SignInLoadingState());
      Response response = await DioHelper.postData(
          endPoint: kSignInEndPoint, map: signInModel.toJson());
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        emit(SignInSuccessState(userEntity: UserModel.fromJson(response.data)));
      }
    } catch (error) {
      if (error is DioException) {
        emit(SignInErrorState(error: ServerFailure.fromServer(error)));
      } else {
        emit(SignInErrorState(
            error: ServerFailure(
                devMessage: error.toString(),
                userMessage: kUnKnownProblemMessage)));
      }
    }
  }
}
