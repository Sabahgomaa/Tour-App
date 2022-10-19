import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Controller/cubit.dart';
import '../Controller/states.dart';
import 'drop_down_cities.dart';
import 'drop_down_countries.dart';
import 'drop_down_shimmer.dart';

class Nationality extends StatelessWidget {
  const Nationality({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RegisterCubit.of(context).countryModel == null
                  ? const ShimmerDropDownButton()
                  : DropDownCountries(
                  itemsList:
                  RegisterCubit.of(context).countryModel!.data!,
                  value:
                  RegisterCubit.of(context).countryDropDownValue,
                  onChanged: (value) {
                    RegisterCubit.of(context)
                        .changeCountryDropDown(value: value);
                    debugPrint(value);
                    RegisterCubit.of(context).cityDropDownValue =
                    null;
                    RegisterCubit.of(context)
                        .getCitiesById(cityId: int.parse(value!));
                  }),
              const SizedBox(height: 12.0),
              RegisterCubit.of(context).countryDropDownValue == null
                  ? const SizedBox()
                  : state is GetCityLoading
                  ? const ShimmerDropDownButton()
                  : DropDownCities(
                itemsList:
                RegisterCubit.of(context).cityModel!.data!,
                value:
                RegisterCubit.of(context).cityDropDownValue,
                onChanged: (value) {
                  RegisterCubit.of(context)
                      .changeCityDropDown(value: value);
                },
              ),
            ],
          );
        });
  }
}
