part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSuccessful extends LoginState {}
class LoginFailure extends LoginState {
  final String errorMessage;

  LoginFailure({required this.errorMessage});

}
