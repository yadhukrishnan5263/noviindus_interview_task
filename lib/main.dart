import 'package:flutter/material.dart';
import 'package:noviindus_interview_task/screens/home/homepage.dart';
import 'package:noviindus_interview_task/screens/login/login.dart';
import 'package:noviindus_interview_task/screens/login/splash%20screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff2B2B2B)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}



