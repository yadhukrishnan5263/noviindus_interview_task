import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noviindus_interview_task/cubit/driver_cubit/driver_cubit.dart';

class AddDriver extends StatefulWidget {
  const AddDriver({super.key});

  @override
  State<AddDriver> createState() => _AddDriverState();
}

class _AddDriverState extends State<AddDriver> {
  TextEditingController nameControlller = TextEditingController();
  TextEditingController LicenseControlller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff2B2B2B),
          toolbarHeight: h * 0.1,
          centerTitle: true,
          leading: IconButton(icon:Icon(Icons.arrow_back,color: Colors.white) , onPressed: () {  Navigator.pop(context);},),
          title: Text(
              "Add Driver",
              style: TextStyle(
                fontFamily: "Axiforma",
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              )
          )
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            Center(
              child: Container(
                height: h * 0.08,
                width: w * 0.84,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0x192a2a2a)),
                child: Center(
                  child: TextFormField(
                    controller: nameControlller,
                    textAlign: TextAlign.center,
                    autofocus: false,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Name",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Color(0xff707070),
                        fontWeight: FontWeight.w500,
                        fontFamily: "Axiforma",
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: h * 0.03,
            ),
            Container(
              height: h * 0.08,
              width: w * 0.84,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0x192a2a2a)),
              child: Center(
                child: TextFormField(
                  controller: LicenseControlller,
                  textAlign: TextAlign.center,
                  autofocus: false,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter License Number",
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: Color(0xff707070),
                      fontWeight: FontWeight.w500,
                      fontFamily: "Axiforma",
                    ),
                  ),
                ),
              ),
            ),
          ]
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          height: h*0.07,
          width:w*0.84,
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
                context.read<DriverCubit>().postDriver(name: nameControlller.text, mobile: "9999999999", license_no: LicenseControlller.text, context: context);
              },
              hoverDuration: Duration(milliseconds: 1000),
              splashColor: Colors.grey.shade300,
              overlayColor: MaterialStateProperty.all(Colors.white30),
              child: Center(
                  child: Text(
                      "Save",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      )
                  )),
            ),
          ),
        ),
      ) ,
    );
  }
}
