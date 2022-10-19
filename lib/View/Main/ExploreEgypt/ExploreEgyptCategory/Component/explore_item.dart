import 'package:flutter/material.dart';
import '../../../../../widget/custome_text.dart';
import '../../Screens/Cities/view.dart';
import '../../Screens/Culuter/view.dart';
import '../Model/explore_model.dart';


// ignore: must_be_immutable
class ExploreCategoryItem extends StatelessWidget {
  Data? exploreEgyptData;

  ExploreCategoryItem({Key? key, required this.exploreEgyptData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (exploreEgyptData!.id == 1) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const ExploreEgyptCitiesView(),
            ),
          );
        }
        // if (exploreEgyptData!.id == 2) {
        //   Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(
        //       builder: (context) => const EgyptionFood(),
        //     ),
        //   );
        //}
        if (exploreEgyptData!.id == 3) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const OurCuluture(),
            ),
          );
        }
      },
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                exploreEgyptData!.photo.toString(),
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*.5,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                // "Book Your Camp"
                text: exploreEgyptData!.name,
                fontSize: 24,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// ExploreEgyptCubit.of(context).getExploreEgyptCitiesItem(itemId: exploreEgyptData!.id);
