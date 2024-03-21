part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeFetchDataLoading extends HomeState {}
class HomeFetchDataSuccessful extends HomeState {}
class HomeFetchDataFailure extends HomeState {}