import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/services/dio_service.dart';
import '../../../../core/services/failure_service.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  static SignUpCubit get(context)=>BlocProvider.of(context);

  signUp() async {
    try {
      emit(SignUpLoadingState());
      Response response =
      await DioHelper.postData(endPoint: '', data: FormData());
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        emit(SignUpSuccessState());
      }
    } catch (error) {
      if (error is DioException) {
        emit(SignUpErrorState(error: ServerFailure.fromServer(error)));
      } else {
        emit(SignUpErrorState(error: ServerFailure("unknown error")));
      }
    }
  }

}
