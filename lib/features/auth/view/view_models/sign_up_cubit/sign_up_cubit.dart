

import 'package:bloc/bloc.dart';
import 'package:book_extchange/features/auth/data/models/govern_model.dart';


import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  late GovernModel selectedGovern;

  void selectNewGovern(GovernModel governModel){
    selectedGovern = governModel;
  }



}
