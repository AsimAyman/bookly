import 'package:bloc/bloc.dart';
import 'package:book_extchange/core/errors/failures.dart';
import 'package:book_extchange/core/utils/api_handler.dart';
import 'package:book_extchange/features/auth/data/models/govern_model.dart';
import 'package:book_extchange/features/auth/data/models/user_model.dart';
import 'package:book_extchange/features/auth/view/view_models/login_cubit/login_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._dio) : super(ProfileInitial());
  final Dio _dio;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  late GovernModel selectedGovern;

  void selectNewGovern(GovernModel governModel) {
    selectedGovern = governModel;
  }

  String getUserGovernName(BuildContext context){
    return BlocProvider.of<LoginCubit>(context).userModel.govern;
  }

  void initController(BuildContext context , GovernModel? governModel){
    UserModel userModel = BlocProvider.of<LoginCubit>(context).userModel;
    emailController.text = userModel.email;
    nameController.text = userModel.name;
    phoneController.text = userModel.mobileNumber;
    cityController.text = userModel.city;
    selectedGovern = governModel!;

  }


  void updateProfile(BuildContext context)async{
    UserModel userModel = BlocProvider.of<LoginCubit>(context).userModel;
    userModel.name = nameController.text;
    userModel.city = cityController.text;
    userModel.govern = selectedGovern.name;
    BlocProvider.of<LoginCubit>(context).userModel = userModel;

    emit(ProfileLoading());
    try {
      var response = await _dio.put(
        "${ApiHandler.baseUrl}update-authenticated-user",
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            "Content-Length": "<calculated when request is sent>",
            "Authorization": "Bearer ${userModel.accessToken}"

          },
        ),
        data: {
          "name": userModel.name,
          "email": userModel.email,
          "mobile": userModel.mobileNumber,
          "password": "123123123",
          "password_confirmation": "123123123",
          "city": userModel.govern,
          "town": userModel.city
        },
      );

      emit(ProfileSuccessful());
    } catch (e) {
      if (e is DioException) {
        var s = ServerSideError.fromDioException(e);
        emit(ProfileFailure(errorMessage: s.errorMessage));
      } else {
        var s = ServerSideError(e.toString());
        emit(ProfileFailure(errorMessage: s.errorMessage));
      }
    }

  }

}
