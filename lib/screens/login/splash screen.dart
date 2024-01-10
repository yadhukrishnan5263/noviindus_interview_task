import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
    body: Container(
      height: h,
      color: Color(0xffFC153B),
      child: Column(
        children: [
          Spacer(),
          Center(child: Image(image: AssetImage("assets/logo.png"),)),
          Spacer(),

        ],
      ),

    ),
    );
  }
}
