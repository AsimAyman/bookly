import 'package:bookly/core/routing/routes.dart';
import 'package:bookly/core/widgets/custom_drop_down_menu.dart';
import 'package:bookly/core/widgets/custom_error_dialog.dart';
import 'package:bookly/core/widgets/custom_main_button.dart';
import 'package:bookly/features/auth/data/models/govern_model.dart';
import 'package:bookly/features/auth/view/view_models/login_cubit/login_cubit.dart';
import 'package:bookly/features/filter/data/models/category_model.dart';
import 'package:bookly/features/filter/view/view_models/filter_cubit.dart';
import 'package:bookly/features/filter/view/views/widgets/custom_price_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class FilterBody extends StatelessWidget {
  const FilterBody({super.key});

  @override
  Widget build(BuildContext context) {
    var filterCubit = BlocProvider.of<FilterCubit>(context);

    return BlocConsumer<FilterCubit, FilterState>(
      listener: (context, state) {
        if(state is FetchFilterResultsFail){
          customErrorDialog(context, title: "There is Error", content: state.errorMessage);
        }
        if (state is FetchFilterResultsSuccess){
          GoRouter.of(context).pushNamed(Routes.kFilterResultsView , extra: filterCubit.filterResults);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is FetchFilterResultsLoading,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const SizedBox(height: 16,),
                      const CustomPriceSilder(),
                      const SizedBox(height: 16,),
                      CustomDropDownMenu<GovernModel>(
                        value: filterCubit.selectedGovernorate,
                        label: "Governorate",
                        items: filterCubit.governsList,
                        onSelect: filterCubit.onSelectGovernorate,
                      ),
                      const SizedBox(height: 16,),
                      Divider(
                        color: Colors.grey.shade400,
                      ),
                      const SizedBox(height: 16,),
                      CustomDropDownMenu<String>(
                        value: filterCubit.categoryType,
                        label: "Category",
                        items: const ["General", "Educational"],
                        onSelect: filterCubit.onSelectCategory,
                      ),
                      const SizedBox(height: 16,),
                      filterCubit.categoryType == "General" ?
                      CustomDropDownMenu<CategoryModel>(
                        value: filterCubit.generalCategory,
                        label: "Subcategory",
                        items: filterCubit.generalCategories,
                        onSelect: filterCubit.onSelectSubGeneralCategory,
                      ) : CustomDropDownMenu<CategoryModel>(
                        value: filterCubit.educationalCategory,
                        label: "Subcategory",
                        items: filterCubit.educationalCategories,
                        onSelect: filterCubit.onSelectSubEducationalCategory,
                      ),
                    ],
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      const Spacer(),
                      CustomMainButton(txt: "Search",onTap: () {
                        filterCubit.filterBooks(BlocProvider.of<LoginCubit>(context).userModel.accessToken);
                      },),
                      const SizedBox(height: 16,),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

