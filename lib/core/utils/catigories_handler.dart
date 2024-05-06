import 'package:Bookly/features/filter/data/models/category_model.dart';
import 'package:Bookly/features/filter/data/repos/category_repo/category_repo.dart';

 class CategoryHandler {

  CategoryHandler(this._categoryRepo , String userAcessToken){
    userToken = userAcessToken;
    getSupCategories();
  }
  final CategoryRepo _categoryRepo;
  String userToken = '';
  static List<CategoryModel> generalCategories = [];
  static List<CategoryModel> educationalCategories = [];

  void getSupCategories()async{
    var results = await _categoryRepo.fetchEducationalCategories(userToken);
    results.fold((l) {

    }, (r) {
      educationalCategories = r;
    });

    var results2 = await _categoryRepo.fetchGeneralCategories(userToken);
    results2.fold((l) {

    }, (r) {
      generalCategories = r;
    });

  }

}
