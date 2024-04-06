
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_models/filter_cubit.dart';

class CustomPriceSilder extends StatefulWidget {
  const CustomPriceSilder({super.key});

  @override
  State<CustomPriceSilder> createState() => _CustomPriceSilderState();
}

class _CustomPriceSilderState extends State<CustomPriceSilder> {

  @override
  Widget build(BuildContext context) {
    var filterCubit = BlocProvider.of<FilterCubit>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Column(
              children: [
                Text(
                  "Price",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    Text(
                      filterCubit.valmin.round().toString(),
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.grey),
                    ),
                    Text(
                      " - ",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.grey),
                    ),
                    Text(
                      filterCubit.valmax.round().toString(),
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.grey),
                    ),

                  ],
                ),
              ],
            ),
            const Spacer(),
            Checkbox(value: filterCubit.filterByPrice, onChanged: (value) {
              setState(() {
                filterCubit.filterByPrice = value!;
              });
            },)
          ],
        ),
        RangeSlider(
          values: RangeValues(filterCubit.valmin, filterCubit.valmax),
          labels: RangeLabels(
              filterCubit.valmin.round().toString(), filterCubit.valmax.round().toString()),
          max: 2000,
          min: 0,
          divisions: 20,

          onChanged: (value) {
            setState(() {
              filterCubit.valmin = value.start;
              filterCubit.valmax = value.end;
              filterCubit.filterByPrice = true;
            });
          },
        ),
      ],
    );
  }
}