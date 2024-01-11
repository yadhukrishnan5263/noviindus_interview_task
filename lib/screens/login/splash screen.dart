import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';

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
            Center(
                child: Image(
              image: AssetImage("assets/logo.png"),
            )),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Container(
                height: h * 0.07,
                width: w * 0.84,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage(),));
                    },
                    hoverDuration: Duration(milliseconds: 1000),
                    splashColor: Colors.grey.shade300,
                    overlayColor: MaterialStateProperty.all(Color(0xffFC153B).withOpacity(0.5)),
                    child: Center(
                        child: Text("Get Started",
                            style: TextStyle(
                              fontFamily: "Axiforma",
                              fontSize: 20,
                              color: Color(0xffFC153B),
                              fontWeight: FontWeight.w500,
                            ))),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
