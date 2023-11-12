import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibook/page/homeScreen/HomeScreen.dart';
import 'package:ibook/page/homeScreen/bloc/home_bloc.dart';
import 'package:ibook/page/onBoarding/bloc/welcome_bloc.dart';
import 'package:ibook/page/onBoarding/welcome.dart';
import 'package:ibook/page/sign_in/signIn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => WelcomeBloc(),
          ),
          BlocProvider(
            lazy: false, // lazy = creation of the bloc as soon as possible
            create: (context) => HomeBloc(),
          ),
        ],
        child: ScreenUtilInit(
          builder: (context, child) =>
           MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                elevation: 0,
                backgroundColor: Colors.white
              )
            ),
            home: Welcome(),
            routes:{
              "/home": (context) => HomeScreen(),
              "/signIn": (context) => SignIn(),
            },
          ),
        ),
      );
  }
}

