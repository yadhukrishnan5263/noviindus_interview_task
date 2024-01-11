import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noviindus_interview_task/cubit/bus_cubit/bus_cubit.dart';
import 'package:noviindus_interview_task/cubit/driver_cubit/driver_cubit.dart';
import 'package:noviindus_interview_task/cubit/login_cubit/login_cubit.dart';
import 'package:noviindus_interview_task/screens/login/splash%20screen.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => LoginCubit()),
    BlocProvider(create: (context) => BusCubit()),
    BlocProvider(create: (context) => DriverCubit()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const LaunchScreen(),
    );
  }
}
