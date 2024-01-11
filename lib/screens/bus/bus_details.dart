import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BusDetail extends StatefulWidget {
  const BusDetail({super.key});

  @override
  State<BusDetail> createState() => _BusDetailState();
}

class _BusDetailState extends State<BusDetail> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2B2B2B),
        toolbarHeight: h * 0.1,
        centerTitle: true,
       leading: IconButton(icon:Icon(Icons.arrow_back,color: Colors.white) , onPressed: () { Navigator.pop(context); },),
        title: Text(
          "KSRTC Swift Scania P-series",
          style: TextStyle(
            fontFamily: "Axiforma",
            color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        )
      )
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                  height: h*0.15,
                  decoration:     BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff2a2a2a)),
                child: Row(
                  children: [
                    Container(
                      width: w*0.55,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                "Rohit sharma",
                                style: TextStyle(
                                  fontFamily: "Axiforma",
                                  fontSize:h*0.029,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                )
                            ),
                            Text(
                                "License no: PJ515196161655",
                                style: TextStyle(
                                  fontFamily: "Axiforma",
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                )
                            )
                          ],
                        ),
                      ),
                    ),
                    Image(image: AssetImage("assets/driver.png"))
                  ]
                ),
              ),
              SizedBox(height: h*0.04,),
              Container(
                  width: w*0.75,
                  height: h*0.6,
                  decoration:     BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(color: Color(0xffDCDCDC),width: 1),
        
              ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 3.0,
                      mainAxisSpacing: 0,
                      childAspectRatio: 1.1
                    ),
                    itemCount: 5 * 10, // 5 columns and 6 rows
                    itemBuilder: (context, index) {
                      // Check if it's the 5th column in the first row
                      if (index < 5) {
                        return index == 4
                            ? Padding(
                          padding: EdgeInsets.all(0.0),
                          child: Container(
                            width: 30.0,
                            child: Center(
                              child: Image.asset("assets/d_seat.png"),
                            ),
                          ),
                        )
                            : SizedBox.shrink();
                      } else {
                        // Check if it's the 2nd column
                        if (index % 5 == 1) {
                          return Padding(
                            padding: EdgeInsets.all(4.0),
                            child: SizedBox.shrink(), // Hide the widget
                          );
                        } else {
                          return Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Container(
                              child: Center(
                                child: ImageIcon(AssetImage("assets/Seat.png"),size: 30,color: Color(0xffFC153B),),
                              ),
                            ),
                          );
                        }
                      }
                    },
                  ),
                ),
              )
        
            ],
          ),
        ),
      ),

    );
  }
}
