import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noviindus_interview_task/cubit/driver_cubit/driver_cubit.dart';
import 'package:noviindus_interview_task/screens/driver/add_driver.dart';

import '../../cubit/bus_cubit/bus_cubit.dart';

class DriverList extends StatefulWidget {
  const DriverList({super.key});

  @override
  State<DriverList> createState() => _DriverListState();
}

class _DriverListState extends State<DriverList> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<DriverCubit>().getDriverList(context: context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff2B2B2B),
          scrolledUnderElevation: 0,
          toolbarHeight: h * 0.1,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("Driver List",
              style: TextStyle(
                fontFamily: "Axiforma",
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocConsumer<DriverCubit, DriverState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is DriverListLoded) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(state.driverlist.length.toString() + " Drivers Found",
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: "Axiforma",
                          color: Color(0xff6B6B6B),
                          fontWeight: FontWeight.w500,
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
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
                              border: Border.all(
                                  color: Color(0xffC1C1C1), width: 0.5)),
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
                                image: AssetImage("assets/driver2.png"),
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
                                  Text(state.driverlist[index].name,
                                      style: TextStyle(
                                        color: Color(0xff474747),
                                        fontSize: 12,
                                        overflow: TextOverflow.clip,
                                        fontWeight: FontWeight.w500,
                                      )),
                                  Text(
                                      "Licn no: " +
                                          state.driverlist[index].licenseNo,
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
                                    context.read<DriverCubit>().deleteDriver(
                                        driver_id: state.driverlist[index].id,
                                        context: context,
                                        driverlist: state.driverlist,
                                        index: index);
                                  },
                                  hoverDuration: Duration(milliseconds: 1000),
                                  splashColor: Colors.grey.shade300,
                                  overlayColor:
                                      MaterialStateProperty.all(Colors.white30),
                                  child: Center(
                                      child: Text("Delete",
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
                      itemCount: state.driverlist.length,
                    )
                  ],
                );
              } else if (state is DriverListError) {
                return Center(
                  child: Text("No Drivers Found",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: "Axiforma",
                        color: Color(0xff6B6B6B),
                        fontWeight: FontWeight.w500,
                      )),
                );
              } else if (state is DeleteDriver) {
                // context.read<DriverCubit>().getDriverList(context: context);
              }
              return Container();
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          height: h * 0.07,
          width: w * 0.9,
          decoration: BoxDecoration(
            color: Color(0xffFC153B),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Material(
            color: Color(0xffFC153B),
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                  builder: (context) => AddDriver(),
                ))
                    .then((value) {
                  BlocProvider.of<DriverCubit>(context)
                      .getDriverList(context: context);
                });
              },
              hoverDuration: Duration(milliseconds: 1000),
              splashColor: Colors.grey.shade300,
              overlayColor: MaterialStateProperty.all(Colors.white30),
              child: Center(
                  child: Text("Add Driver",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ))),
            ),
          ),
        ),
      ),
    );
  }
}
