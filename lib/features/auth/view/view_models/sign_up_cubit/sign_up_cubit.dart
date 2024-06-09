// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_handler.dart';
import 'package:bookly/features/auth/data/models/govern_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._dio) : super(SignUpInitial());

  final Dio _dio;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late GovernModel selectedGovern;

  void selectNewGovern(GovernModel governModel) {
    selectedGovern = governModel;
  }

  void signUp() async {
    emit(SignUpLoading());
    try {
      var response = await _dio.post(
        "${ApiHandler.baseUrl}register",
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            "Content-Length": "<calculated when request is sent>",
          },
        ),
        data: {
          "name": nameController.text,
          "email": emailController.text,
          "mobile_number": phoneController.text,
          "password": passwordController.text,
          "password_confirmation": passwordController.text,
          "city": selectedGovern.name,
          "town": cityController.text
        },
      );

      emit(SignUpSuccessful());
    } catch (e) {
      if (e is DioException) {
       var s = ServerSideError.fromDioException(e);
        emit(SignUpFailure(errorMessage: s.errorMessage));
      } else {
        var s = ServerSideError(e.toString());
        emit(SignUpFailure(errorMessage: s.errorMessage));
      }
    }
  }
}
/*

    get user info

      var response = await _dio.get(
        "http://10.0.2.2:8000/api/authenticated-user",
        options: Options(
          headers: {
            "Authorization":
                "Bearer 2|HfxgbMi7yYbE0kaDLXtAeWXnfSFz7TJwH2tDCIMFf0fd0dff",
          },
        ),
        // data: {
        //   "name": "yousef",
        //   "email": "yousef@email.com",
        //   "mobile_number": "01017190886",
        //   "password": "123123123",
        //   "password_confirmation": "123123123",
        //   "city": "القاهرة",
        //   "town": "مدينة نصر"
        // },
      );

 */
