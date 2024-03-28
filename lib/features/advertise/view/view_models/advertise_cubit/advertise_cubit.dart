import 'dart:io';

import 'package:book_extchange/core/routing/routes.dart';
import 'package:book_extchange/features/advertise/view/view_models/advertise_cubit/advertise_state.dart';
import 'package:book_extchange/features/advertise/view/views/widgets/categories.dart';
import 'package:book_extchange/features/advertise/view/views/widgets/details.dart';
import 'package:book_extchange/features/advertise/view/views/widgets/images.dart';
import 'package:book_extchange/features/advertise/view/views/widgets/location.dart';
import 'package:book_extchange/features/advertise/view/views/widgets/price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class AdvertiseCubit extends Cubit<AdvertiseState> {
  AdvertiseCubit() : super(AdvertiseInitState());

  static AdvertiseCubit get(context) => BlocProvider.of(context);

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
  var selectedCategory;
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
  void nextStep(context) {
    if (stepIndex < steps.length - 1) {
      stepIndex++;
      emit(NextStep());
    } else {
      print("the title: ${titleController.text}");
      print("the description: ${descriptionController.text}");
      print("the price: ${priceController.text}");
      print("the bookConditions: ${selectedCondition}");
      print("isNegotiable: ${isNegotiable}");
      print("isExchangeable: ${isExchangeable}");
      print("Governorate: ${selectedGovernorate.name}");
      print("City: ${cityController.text}");
      print("book type: ${selectedBookType}");
      print("book category: ${selectedCategory}");
      print("book grade:${selectedGrade}");
      for (var image in selectedImages) {
        print('Image=>>>>>>>>>>>>>>>>> $image');
      }
      GoRouter.of(context).pushReplacementNamed(Routes.kSuccessAdvertiseView);
    }
  }
}
