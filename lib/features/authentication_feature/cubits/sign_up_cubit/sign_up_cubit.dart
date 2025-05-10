import 'package:bloc/bloc.dart';
import 'package:deaf_gain/core/utils/strings/end_points.dart';
import 'package:deaf_gain/core/utils/strings/strings.dart';
import 'package:deaf_gain/features/authentication_feature/entities/sign_up_entity.dart';
import 'package:deaf_gain/features/authentication_feature/entities/user_entity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/services/dio_service.dart';
import '../../../../core/services/failure_service.dart';
import '../../models/sign_up_model.dart';
import '../../models/user_model.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  static SignUpCubit get(context) => BlocProvider.of(context);

  signUp({required SignUpModel signUpModel}) async {
    try {
      emit(SignUpLoadingState());
      Response response = await DioHelper.postData(
        endPoint: kRegisterEndPoint,
        map: signUpModel.toJson(),
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        emit(SignUpSuccessState(
          userEntity: UserModel.fromJson(response.data)
        ));
      }
    } catch (error) {
      if (error is DioException) {
        emit(SignUpErrorState(error: ServerFailure.fromServer(error)));
      } else {
        emit(SignUpErrorState(
            error: ServerFailure(
                devMessage: error.toString(),
                userMessage: kUnKnownProblemMessage)));
      }
    }
  }

}
