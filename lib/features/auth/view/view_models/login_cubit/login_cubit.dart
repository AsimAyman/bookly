import 'package:bloc/bloc.dart';
import 'package:book_extchange/core/errors/failures.dart';
import 'package:book_extchange/core/routing/routes.dart';
import 'package:book_extchange/core/utils/api_handler.dart';
import 'package:book_extchange/features/auth/data/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._dio) : super(LoginInitial());

  final Dio _dio;
  late SharedPreferences _prefs;

  bool isSignedIn = false;
  late UserModel userModel;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  void login() async {
    emit(LoginLoading());
    try {
      var response = await _dio.post(
        "${ApiHandler.baseUrl}login",
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            "Content-Length": "<calculated when request is sent>",
          },
        ),
        data: {
          "email": emailController.text,
          "password": passwordController.text,
        },
      );
      userModel = UserModel.fromJson(response.data['data']);
      _prefs = await SharedPreferences.getInstance();
      _prefs.setString("userToken", userModel.accessToken);
      isSignedIn = true;
      emit(LoginSuccessful());
    } catch (e) {
      if (e is DioException) {
        var s = ServerSideError.fromDioException(e);
        emit(LoginFailure(errorMessage: s.errorMessage));
      } else {
        var s = ServerSideError(e.toString());
        emit(LoginFailure(errorMessage: s.errorMessage));
      }
    }
  }

  Future<void> checkIfSignedIn()async{
    _prefs = await SharedPreferences.getInstance();
    String? accessToken =  _prefs.getString("userToken");
    print("start checkIfSignedIn");
    print(accessToken);
    if(accessToken == null){
      isSignedIn = false;
      return;
    }else{
      await _getUserCredByToken(accessToken);
    }
  }

  Future<void> _getUserCredByToken(String token)async{
    try {
      var response = await _dio.get(
        "${ApiHandler.baseUrl}authenticated-user",
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            "Authorization": "Bearer $token"
          },
        ),
      );
      Map jsonData = response.data['data'];
      jsonData['access_token'] = token;
      userModel = UserModel.fromJson(jsonData);
      isSignedIn = true;
    }catch(e){
      print("error in _getUserCredByToken $e");
      isSignedIn = false;
      return;
    }
  }

  Future<void> logout()async{
    _prefs = await SharedPreferences.getInstance();
    _prefs.remove("userToken");
    isSignedIn = false;
  }
}
