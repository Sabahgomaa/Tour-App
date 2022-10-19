import 'package:flutter/material.dart';
import '../../../../../../widget/custome_text.dart';
import '../Model/cities_model.dart';

// ignore: must_be_immutable
class CitiesItem extends StatelessWidget {
  Datum? cityItemData;

  CitiesItem({Key? key, required this.cityItemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              cityItemData!.attachments![0].url.toString(),
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .5,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomText(
              // "Book Your Camp"
              text: cityItemData!.name,
              fontSize: 15,
              color: Colors.black,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
