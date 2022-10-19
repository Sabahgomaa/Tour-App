import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BacgroundClass extends StatelessWidget {
  Widget screen;
  Color? color= Colors.black.withOpacity(.5) ;
  BacgroundClass({Key? key, required this.screen,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/OurEgypt.jpeg'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black,
            child: Image.asset('assets/images/BackgroundImage.jpeg'),
            // decoration: const BoxDecoration(
            //   image: DecorationImage(
            //     image:
            //     // fit: BoxFit.fill,
            //    ),
            // ),
          ),
          Container(
            //width: double.infinity,
            height: 608,
            color: Colors.black.withOpacity(.5) ,
            child: screen,
          ),
        ],
      ),
    );
  }
}
