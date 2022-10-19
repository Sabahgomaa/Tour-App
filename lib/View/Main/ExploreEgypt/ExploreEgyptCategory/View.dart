import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../const/color.dart';
import '../../../AuthCycle/BackGroundClass/background_class.dart';
import 'Component/explore_item.dart';
import 'Component/text_intro.dart';
import 'Controller/cubit.dart';
import 'Controller/states.dart';

class ExploreEgyptView extends StatelessWidget {
  const ExploreEgyptView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BacgroundClass(
          screen: SingleChildScrollView(
            child: Column(
              children: [
                const TextIntro(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocConsumer<ExploreEgyptCubit, ExploreEgyptStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return state is ExploreEgyptLoading
                            ? const CircularProgressIndicator(color: Dahab,)
                            : ListView.builder(
                          itemCount: ExploreEgyptCubit.of(context)
                              .exploreEgyptModel!
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
                            return ExploreCategoryItem(
                              exploreEgyptData: ExploreEgyptCubit.of(context)
                                  .exploreEgyptModel!
                                  .data![index],
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
