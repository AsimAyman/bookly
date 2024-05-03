import 'package:book_extchange/core/utils/book_type_handler.dart';
import 'package:book_extchange/core/utils/catigories_handler.dart';
import 'package:book_extchange/core/widgets/custom_drop_down_menu.dart';
import 'package:book_extchange/core/widgets/custom_main_button.dart';
import 'package:book_extchange/features/advertise/view/view_models/advertise_cubit/advertise_cubit.dart';
import 'package:book_extchange/features/advertise/view/view_models/advertise_cubit/advertise_state.dart';
import 'package:book_extchange/features/filter/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<AdvertiseCubit, AdvertiseState>(
        listener: (context, state) => {},
        builder: (context, state) =>
            Form(
              key: formKey,
              child: Column(
                children: [
                  CustomDropDownMenu<String>(items: BookTypeHandler.bookTypes,
                    label: 'Book Type',
                    onSelect: AdvertiseCubit
                        .get(context)
                        .onSelectBookType,
                    value: AdvertiseCubit
                        .get(context)
                        .selectedBookType,),
                  const SizedBox(height: 16,),

                  // CustomDropDownMenu<String>(items: CategoryHandler.allCategories,
                  //     label: 'Categories',
                  //     onSelect: (v) => {},
                  //     value: AdvertiseCubit
                  //         .get(context)
                  //         .selectedBookType),
                  // CustomDropDownMenu<String>(items: GradeHandler.allGrade,
                  //     label: 'Grades',
                  //     onSelect: (v) => {},
                  //     value: AdvertiseCubit
                  //         .get(context)
                  //         .selectedBookType),

                  getSubDropDown(),
                  const SizedBox(height: 24,),

                  CustomMainButton(
                    txt: 'Next',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        AdvertiseCubit.get(context).nextStep(context);
                      }
                    },
                  )

                ],
              ),
            ),
      ),
    );
  }

  Widget getSubDropDown() {
    if (AdvertiseCubit
        .get(context)
        .selectedBookType == 'General') {
      return CustomDropDownMenu<CategoryModel>(items: CategoryHandler.generalCategories,
          label: 'Categories',
          onSelect:AdvertiseCubit
              .get(context)
              .onSelectCategory,
          value: AdvertiseCubit
              .get(context)
              .selectedCategory);
    } else {
      return CustomDropDownMenu<CategoryModel>(items: CategoryHandler.educationalCategories,
          label: 'Grades',
          onSelect:AdvertiseCubit
              .get(context)
              .onSelectGrade,
          value: AdvertiseCubit
              .get(context)
              .selectedGrade);
    }
  }
}


