import 'package:flutter/material.dart';
import 'package:tour_app/View/AuthCycle/SignUp/Component/nationality.dart';
import '../../../../widget/custome_text.dart';
import '../../../../widget/custome_textformfield.dart';
import '../Controller/cubit.dart';


class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit  = RegisterCubit.of(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomText(
            text: 'create profile'.toUpperCase(),
            textAlign: TextAlign.center,
            color: Colors.white,
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.white,
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              CustomeTextFormField(
                label: "full oficel name",
                type: TextInputType.name,
                controller:cubit.fullOfficelNameController,
                radius: 10,
                height: 30,
              ),
              const Nationality(),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomeTextFormField(
                    label: 'barthday date',
                    width: 120,
                    controller: null,
                    radius: 10,
                    height: 30,
                  ),
                  CustomeTextFormField(
                    label: 'job title',
                    width: 120,
                    controller: null,
                    radius: 10,
                    height: 30,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
