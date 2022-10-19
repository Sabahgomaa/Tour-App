import 'package:flutter/material.dart';

import '../../../../../widget/custome_text.dart';


class TextIntro extends StatelessWidget {
  const TextIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Center(
            child: CustomText(
              text: 'explore our amazing egypt',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
