import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff2B2B2B),
        toolbarHeight: h * 0.1,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Container(
              height: h * 0.05,
              child: Image(image: AssetImage("assets/logo.png"))),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: w / 2 - 30,
                      height: h * 0.23,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xfffc153b)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: h * 0.018, top: h * 0.01),
                              child: Text("Bus",
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontFamily: "Axiforma",
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  )),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: h * 0.018, bottom: h * 0.01),
                              child: Text("Manage your Bus",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Axiforma",
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image(
                                    image: AssetImage("assets/bus.png"),
                                    height: h * 0.14,
                                    width: w * 0.316),
                              ],
                            )
                          ])),
                  Container(
                    width: w / 2 - 30,
                    height: h * 0.23,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff2a2a2a)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: h * 0.018, top: h * 0.01),
                            child: Text("Driver",
                                style: TextStyle(
                                  fontSize: 26,
                                  fontFamily: "Axiforma",
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: h * 0.018, bottom: h * 0.01),
                            child: Text("Manage your Driver",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Axiforma",
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image(
                                image: AssetImage("assets/driver.png"),
                                height: h * 0.14,
                                width: w * 0.33,
                              ),
                            ],
                          )
                        ]),
                  )
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 15),
            child: Text("21 Buses Found",
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xff6B6B6B),
                  fontFamily: "Axiforma",
                  fontWeight: FontWeight.w500,
                )),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
              child: Container(
                height: h*0.095,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffC1C1C1).withOpacity(0.3),
                        spreadRadius: 0.5,
                        blurRadius: 6,
                        offset: Offset(0, 1),
                      )
                    ],
                    color: Colors.white,
                    border: Border.all(color: Color(0xffC1C1C1), width: 0.5)),
                child: Row(
                  children: [
                    Container(
                        width: h*0.095,
                        height: h*0.095,
                        decoration:     BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                            color: Color(0xfff3f3f3)),
                      child: Image(image: AssetImage("assets/bus2.png"),),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("KSRTC",style: TextStyle(
                          color: Color(0xff474747),
                    fontSize: 12,
                      fontWeight: FontWeight.w500,

                    )), Text("Swift Scania P-​series",style: TextStyle(
                    fontSize: 12,
                          color: Color(0xff474747),
                      fontWeight: FontWeight.w500,
                    )),
                      ],
                    )

                  ]
                ),
              ),
            ),
            itemCount: 10,
          )
        ]),
      ),
    );
  }
}
