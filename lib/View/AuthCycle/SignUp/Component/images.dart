import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../widget/custome_button.dart';
import '../Controller/cubit.dart';

class ImageUsers extends StatelessWidget {
  const ImageUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = RegisterCubit.of(context);
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) => Column(
        children: [
          Column(

            children: [
              Text(
                'Choose Your Profile Picture'.toUpperCase(),
                textAlign: TextAlign.end,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: const Text("cubit.profilePicture!.path.split("").last"),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    width: 131,
                    height: 28,
                  ),
                  CustomeButton(
                    width: 130,
                    height: 30,
                    fontSize: 15,
                    radius: 0,
                    textColor: Colors.black,
                    buttonColor: Colors.white,
                    text: 'Choose File',
                    pressed: () {
                      cubit.pickProfilePicture();
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Text(
                'passport Image / Id Image'.toUpperCase(),
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: const Text("cubit.passportPicture!.path.split("").last"),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    width: 140,
                    height: 28,
                  ),
                  CustomeButton(
                    width: 130,
                    height: 30,
                    radius: 0,
                    fontSize: 15,
                    textColor: Colors.black,
                    buttonColor: Colors.white,
                    text: 'Choose File',
                    pressed: () {
                      cubit.pickPassportPicture();
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          )
        ],
      ),
    );
  }
}
