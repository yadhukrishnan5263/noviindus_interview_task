import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noviindus_interview_task/cubit/bus_cubit/bus_cubit.dart';
import 'package:noviindus_interview_task/screens/bus/bus_details.dart';
import 'package:noviindus_interview_task/screens/driver/driver_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<BusCubit>().getBusList(context: context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
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
                                    width: w * 0.304),
                              ],
                            )
                          ])),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DriverList(),
                      ));
                    },
                    child: Container(
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
                              padding: EdgeInsets.only(
                                  left: h * 0.018, top: h * 0.01),
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
                    ),
                  )
                ]),
          ),
          BlocConsumer<BusCubit, BusState>(listener: (context, state) {
            // TODO: implement listener
          }, builder: (context, state) {
            if (state is BusListLoded) {
              return Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 15),
                child: Text(state.buslist.length.toString() + " Buses Found",
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xff6B6B6B),
                      fontFamily: "Axiforma",
                      fontWeight: FontWeight.w500,
                    )),
              );
            }
            return Container();
          }),
          BlocConsumer<BusCubit, BusState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is BusListLoded) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                    child: Container(
                      height: h * 0.095,
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
                          border:
                              Border.all(color: Color(0xffC1C1C1), width: 0.5)),
                      child: Row(children: [
                        Container(
                          width: h * 0.095,
                          height: h * 0.095,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                              color: Color(0xfff3f3f3)),
                          child: Image(
                            image: AssetImage("assets/bus2.png"),
                          ),
                        ),
                        SizedBox(
                          width: w * 0.05,
                        ),
                        Container(
                          width: w * 0.4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(state.buslist[index].name,
                                  style: TextStyle(
                                    color: Color(0xff474747),
                                    fontSize: 12,
                                    overflow: TextOverflow.clip,
                                    fontWeight: FontWeight.w500,
                                  )),
                              Text(state.buslist[index].type,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff474747),
                                      fontWeight: FontWeight.w500,
                                      overflow: TextOverflow.clip)),
                            ],
                          ),
                        ),
                        Container(
                          height: h * 0.04,
                          width: w * 0.2,
                          decoration: BoxDecoration(
                            color: Color(0xffFC153B),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Material(
                            color: Color(0xffFC153B),
                            borderRadius: BorderRadius.circular(4),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(4),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => BusDetail(
                                    busmodel: state.buslist[index],
                                    seating:
                                        state.buslist[index].type == "Ordinary"
                                            ? 1
                                            : 2,
                                  ),
                                ));
                              },
                              hoverDuration: Duration(milliseconds: 1000),
                              splashColor: Colors.grey.shade300,
                              overlayColor:
                                  MaterialStateProperty.all(Colors.white30),
                              child: Center(
                                  child: Text("Manage",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      ))),
                            ),
                          ),
                        )
                      ]),
                    ),
                  ),
                  itemCount: state.buslist.length,
                );
              } else if (state is BusListError) {
                Center(
                    child: Text(
                  "No Buses",
                  style: TextStyle(fontFamily: "Axiforma"),
                ));
              }
              return Container();
            },
          )
        ]),
      ),
    );
  }
}
