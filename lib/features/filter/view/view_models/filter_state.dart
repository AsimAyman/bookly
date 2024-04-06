part of 'filter_cubit.dart';

@immutable
abstract class FilterState {}

class FilterInitial extends FilterState {}
class SelectGovernorate extends FilterState{}
class SelectCategory extends FilterState{}
class FilterLoading extends FilterState {}
class FetchedGeneralCategories extends FilterState {}
class FetchedEducationalCategories extends FilterState {}

class FetchFilterResultsLoading extends FilterState{}
class FetchFilterResultsSuccess extends FilterState{}
class FetchFilterResultsFail extends FilterState{
  final String errorMessage;
  FetchFilterResultsFail(this.errorMessage);
}
