import 'package:flutter/material.dart';

import '../../../../widget/custome_button.dart';
import '../../../../widget/custome_textformfield.dart';



class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return  Center(
        child:
        Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 30,),
                CustomeTextFormField(controller: emailController,label: "e-mail",type: TextInputType.emailAddress,),
                const SizedBox(height: 20,),
                CustomeTextFormField(label: "your old password", controller: passwordController),
                const SizedBox(height: 30,),
                CustomeButton(width:200 ,height:50,fontSize:20 ,text: 'Reset Password', pressed: (){}),
                const SizedBox(height: 10,),
              ],
            ))) ;
  }
}
