import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noviindus_interview_task/cubit/bus_cubit/bus_cubit.dart';
import 'package:noviindus_interview_task/cubit/login_cubit/login_cubit.dart';
import 'package:noviindus_interview_task/data/utils/snackbar.dart';
import 'package:noviindus_interview_task/screens/home/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => BusCubit(),
                    child: HomePage(),
                  ),
                ),
                (route) => false);
          }
        },
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: h * 0.34,
                  color: Color(0xff2B2B2B),
                ),
                Positioned(
                    right: 0,
                    child: Image(
                      image: AssetImage("assets/Polygon.png"),
                      height: h * 0.34,
                      fit: BoxFit.contain,
                    )),
                Positioned(
                  left: w * 0.1,
                  bottom: h * 0.065,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Welcome",
                            style: TextStyle(
                              fontFamily: "Axiforma",
                              fontSize: 41,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            )),
                        Text("Manage your Bus and Drivers",
                            style: TextStyle(
                              fontFamily: "Axiforma",
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ))
                      ]),
                )
              ],
            ),
            SizedBox(
              height: h * 0.08,
            ),
            Container(
              height: h * 0.08,
              width: w * 0.84,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0x192a2a2a)),
              child: Center(
                child: TextFormField(
                  controller: usernameController,
                  textAlign: TextAlign.center,
                  autofocus: false,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Username",
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
                  controller: passwordController,
                  textAlign: TextAlign.center,
                  autofocus: false,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Password",
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
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Container(
                height: h * 0.07,
                width: w * 0.84,
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
                      if (usernameController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        context.read<LoginCubit>().login(
                            username: usernameController.text,
                            password: passwordController.text,
                            context: context);
                      } else {
                        showError(
                            context, "Please Enter Username and Password");
                      }
                    },
                    hoverDuration: Duration(milliseconds: 1000),
                    splashColor: Colors.grey.shade300,
                    overlayColor: MaterialStateProperty.all(Colors.white30),
                    child: Center(
                        child: Text("Get Started",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Axiforma",
                              color: Colors.white,
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
