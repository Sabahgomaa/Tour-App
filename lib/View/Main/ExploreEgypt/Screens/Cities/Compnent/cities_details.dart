import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../const/color.dart';
import '../../../../../../widget/custome_text.dart';
import '../../../../../AuthCycle/BackGroundClass/background_class.dart';
import '../Controller/cubit.dart';
import '../Controller/states.dart';
import '../Model/cities_model.dart';

// ignore: must_be_immutable
class CitiesDetailes extends StatelessWidget {
  Datum? cityItemData;

  CitiesDetailes({Key? key, this.cityItemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BacgroundClass(
          color: Colors.white.withOpacity(.9),
          screen: SingleChildScrollView(
            child: Column(
              children: [
                CustomText(
                  text: cityItemData!.name,
                  fontSize: 15,
                  color: Colors.black,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.bold,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocConsumer<ExploreEgyptCitiesCubit,
                      ExploreEgyptCitiesStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return state is ExploreEgyptCitiesLoading
                            ? const CircularProgressIndicator(color: Dahab,)
                            : ListView.builder(
                          itemCount: cityItemData!.attachments!.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          // gridDelegate:
                          //     const SliverGridDelegateWithFixedCrossAxisCount(
                          //   crossAxisCount: 2,
                          //   crossAxisSpacing: 8,
                          //   mainAxisSpacing: 8.0,
                          // ),
                          itemBuilder: (context, index) {
                            return Container(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(cityItemData!
                                    .attachments![index].url
                                    .toString(),
                                  fit: BoxFit.fill,
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height*.4,
                                ),
                              ),
                            );
                          },
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
//