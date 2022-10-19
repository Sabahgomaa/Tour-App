import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../Core/router.dart';
import '../../../../../const/color.dart';
import '../../../../AuthCycle/BackGroundClass/background_class.dart';
import '../../ExploreEgyptCategory/Component/text_intro.dart';
import 'Compnent/cities_details.dart';
import 'Compnent/cities_item.dart';
import 'Controller/cubit.dart';
import 'Controller/states.dart';


class ExploreEgyptCitiesView extends StatelessWidget {
  const ExploreEgyptCitiesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BacgroundClass(
          color: Colors.white.withOpacity(.8),
          screen: SingleChildScrollView(
            child: Column(
              children: [
                const TextIntro(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocConsumer<ExploreEgyptCitiesCubit,
                      ExploreEgyptCitiesStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return state is ExploreEgyptCitiesLoading
                            ? const CircularProgressIndicator(color: Dahab,)
                            : ListView.builder(
                            itemCount: ExploreEgyptCitiesCubit.of(context)
                                .citiesModel!
                                .data!
                                .length,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            // gridDelegate:
                            //     const SliverGridDelegateWithFixedCrossAxisCount(
                            //   crossAxisCount: 2,
                            //   crossAxisSpacing: 8,
                            //   mainAxisSpacing: 8.0,
                            // ),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  MagicRouter.navigateTo(CitiesDetailes(
                                    cityItemData:
                                    ExploreEgyptCitiesCubit.of(
                                        context)
                                        .citiesModel!
                                        .data![index],
                                  ),);
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => CitiesDetailes(
                                  //       cityItemData:
                                  //           ExploreEgyptCitiesCubit.of(
                                  //                   context)
                                  //               .citiesModel!
                                  //               .data![index],
                                  //     ),
                                  //   ),
                                  // );
                                },
                                child: CitiesItem(
                                  cityItemData:
                                  ExploreEgyptCitiesCubit.of(context)
                                      .citiesModel!
                                      .data![index],
                                ),
                              );
                            });
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
