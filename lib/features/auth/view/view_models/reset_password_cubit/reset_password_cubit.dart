// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this._dio) : super(ResetPasswordInitial());
  final Dio _dio;
  final TextEditingController emailController = TextEditingController();

  void resetPassword()async{
    emit(ResetPasswordLoading());
    try {
      var response = await _dio.post(
        "${ApiHandler.baseUrl}password/reset-password",
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            "Content-Length": "<calculated when request is sent>",
          },
        ),
        data: {
          "email": emailController.text,
        },
      );

      emit(ResetPasswordSuccessful());
    } catch (e) {
      if (e is DioException) {
        var s = ServerSideError.fromDioException(e);
        emit(ResetPasswordFailure(errorMessage: s.errorMessage));
      } else {
        var s = ServerSideError(e.toString());
        emit(ResetPasswordFailure(errorMessage: s.errorMessage));
      }
    }
  }

}
