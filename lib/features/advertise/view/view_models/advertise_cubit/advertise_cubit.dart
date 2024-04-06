import 'dart:io';

import 'package:book_extchange/core/routing/routes.dart';
import 'package:book_extchange/features/advertise/data/repo/add_book_repo.dart';
import 'package:book_extchange/features/advertise/view/view_models/advertise_cubit/advertise_state.dart';
import 'package:book_extchange/features/advertise/view/views/widgets/categories.dart';
import 'package:book_extchange/features/advertise/view/views/widgets/details.dart';
import 'package:book_extchange/features/advertise/view/views/widgets/images.dart';
import 'package:book_extchange/features/advertise/view/views/widgets/location.dart';
import 'package:book_extchange/features/advertise/view/views/widgets/price.dart';
import 'package:book_extchange/features/filter/data/models/category_model.dart';
import 'package:book_extchange/features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class AdvertiseCubit extends Cubit<AdvertiseState> {
  AdvertiseCubit(this._addBookRepo, this.userAccessToken)
      : super(AdvertiseInitState());

  static AdvertiseCubit get(context) => BlocProvider.of(context);

  final AddBookRepo _addBookRepo;
  final String userAccessToken;

  List<Widget> steps = [
    Details(),
    Price(),
    Location(),
    const Categories(),
    const Images(),
  ];
  int stepIndex = 0;
  List<File> selectedImages = [];

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  var selectedCondition;
  var selectedGovernorate;
  var selectedBookType;
  CategoryModel? selectedCategory;
  var selectedGrade;

  bool isNegotiable = false;
  bool isExchangeable = false;

  void backWordStep(context) {
    if (stepIndex >= 1) {
      stepIndex--;
      emit(BackWordStep());
    } else {
      GoRouter.of(context).pop();
    }
  }

  void onSelectCondition(value) {
    selectedCondition = value;
    emit(SelectCondition());
  }

  void onSelectGovernorate(value) {
    selectedGovernorate = value;
    emit(SelectGovernorate());
  }

  void onSelectBookType(value) {
    selectedBookType = value;
    emit(SelectBookType());
  }

  void onSelectCategory(value) {
    selectedCategory = value;
    emit(SelectedCategory());
  }

  void onSelectGrade(value) {
    selectedGrade = value;
    emit(SelectedGrade());
  }

  void toggleNegotiable(value) {
    isNegotiable = value;
    emit(ToggleNegotiable());
  }

  void toggleExchangeable(value) {
    isExchangeable = value;
    emit(ToggleExchangeable());
  }

  void takeImage() async {
    ImagePicker imagePicker = ImagePicker();
    File? selectedImage;
    var pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage == null) {
      return;
    } else {
      selectedImage = File(pickedImage.path);
      selectedImages.add(selectedImage);
      emit(AddImage());
      print('image is added');
    }
  }

  void deleteImage(image) {
    selectedImages.remove(image);
    emit(DeleteImage());
  }

  void editImage(image) async {
    ImagePicker imagePicker = ImagePicker();
    var pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage == null) {
      return;
    } else {
      int modifiedIndex = selectedImages.indexOf(image);
      selectedImages[modifiedIndex] = File(pickedImage.path);
      emit(EditImage());
    }
  }

  void nextStep(context) async {
    if (stepIndex < steps.length - 1) {
      stepIndex++;
      emit(NextStep());
    } else {
      emit(AddBookLoadingState());
      String cat = selectedBookType == "Educational" ? "17" : selectedCategory!.id.toString() ;
      String subCat = selectedBookType == "Educational" ? selectedCategory!.id.toString() : "";
      BookModel bookModel = BookModel(
        id: 0,
        title: titleController.text,
        description: descriptionController.text,
        govern: selectedGovernorate.name,
        city: cityController.text,
        price: priceController.text,
        isNegotiable: isNegotiable ? 1:0,
        isExchangeable: isExchangeable ? 1:0,
        status: 1,
        ownerName: "ownerName",
        ownerPhone: "ownerPhone",
        category: cat,
        subCategory: subCat,
        subject: "",
        imgsPath: ["",""],
      );
      var results = await _addBookRepo.addNewBook(userAccessToken, bookModel, selectedImages);
      results.fold((l) {
        emit(AddBookFailureState(errorMessage: l.errorMessage));
      }, (r) {
        emit(AddBookSuccessfulState());

        GoRouter.of(context).pushReplacementNamed(Routes.kSuccessAdvertiseView);

      });
    }
  }
}
