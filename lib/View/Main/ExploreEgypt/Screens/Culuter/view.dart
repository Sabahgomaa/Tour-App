// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../widget/custome_text.dart';
import '../../../../AuthCycle/BackGroundClass/background_class.dart';
import '../../ExploreEgyptCategory/Controller/cubit.dart';
import '../../ExploreEgyptCategory/Controller/states.dart';
import 'Component/text_intro.dart';

class OurCuluture extends StatelessWidget {
  const OurCuluture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BacgroundClass(
          color: Colors.white.withOpacity(.9),
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
                            ? const Text('ششششششششششش')
                            : Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 323,
                                height: 232,
                                child: Image.network(
                                  ExploreEgyptCubit.of(context)
                                      .exploreEgyptModel!
                                      .data![2]
                                      .photo
                                      .toString(),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                alignment: Alignment.topLeft,
                                child: CustomText(
                                  text: ExploreEgyptCubit.of(context)
                                      .exploreEgyptModel!
                                      .data![2]
                                      .description,
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
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
