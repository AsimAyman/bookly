import 'package:bloc/bloc.dart';
import 'package:bookly/core/utils/govern_handler.dart';
import 'package:bookly/features/auth/data/models/govern_model.dart';
import 'package:bookly/features/filter/data/models/category_model.dart';
import 'package:bookly/features/filter/data/repos/category_repo/category_repo.dart';
import 'package:bookly/features/filter/data/repos/filter_repo/filter_repo.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit(this._filterRepo,this._categoryRepo, this.userAccessToken , super.initialState) {
    governsList.insert( 0 , const GovernModel(name: "All", id: "100"));
    getGeneralCategories();
    getEducationalCategories();
  }

  double valmin = 50;
  double valmax = 500;
  bool filterByPrice = false;

  final CategoryRepo _categoryRepo;
  final FilterRepo _filterRepo;
  final String userAccessToken;
  GovernModel? selectedGovernorate;
  List<GovernModel> governsList = GovernHandler.allGoverns.toList();
  String categoryType = 'General';

  List<CategoryModel> generalCategories = [];
  List<CategoryModel> educationalCategories = [];
  CategoryModel? generalCategory;
  CategoryModel? educationalCategory;

  List<BookModel> filterResults = [];

  void onSelectGovernorate(value) {
    selectedGovernorate = value;
    emit(SelectGovernorate());
  }

  void onSelectCategory(value) {
    categoryType = value;
    emit(SelectCategory());
  }

  void onSelectSubGeneralCategory(value) {
    generalCategory = value;
    emit(SelectCategory());
  }
  void onSelectSubEducationalCategory(value) {
    educationalCategory = value;
    emit(SelectCategory());
  }


  void getGeneralCategories() async {
    emit(FilterLoading());
    var results = await _categoryRepo.fetchGeneralCategories(userAccessToken);
    results.fold((l) {
       
      emit(FetchedGeneralCategories());

    }, (r) {
      generalCategories = r;
      generalCategory = generalCategories[0];
      emit(FetchedGeneralCategories());

    });
  }

  void getEducationalCategories() async {
    emit(FilterLoading());
    var results = await _categoryRepo.fetchEducationalCategories(userAccessToken);
    results.fold((l) {
       
      emit(FetchedEducationalCategories());

    }, (r) {
      educationalCategories = r;
      educationalCategory = educationalCategories[0];
      emit(FetchedEducationalCategories());

    });
  }

  void filterBooks(String userToken)async{
    emit(FetchFilterResultsLoading());
  String govern = selectedGovernorate?.name ?? "";
  String subCategoryID = "";
  if(categoryType == "General"){
    subCategoryID = generalCategory?.id.toString() ?? "";
  }else{
    subCategoryID =  educationalCategory?.id.toString() ?? "";
  }
   var results = await _filterRepo.filterAndFetchResults(userToken, govern, filterByPrice, [valmin.toString() , valmax.toString()], categoryType == "Educational", subCategoryID);

  results.fold((l) {
    emit(FetchFilterResultsFail(l.errorMessage));
  }, (r) {
    filterResults = [];
    filterResults = r;
    emit(FetchFilterResultsSuccess());
  });



  }



}
