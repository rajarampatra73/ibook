import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibook/page/bloc_provider.dart';
import 'package:ibook/page/homeScreen/HomeScreen.dart';
import 'package:ibook/page/onBoarding/welcome.dart';
import 'package:ibook/page/register/register.dart';
import 'package:ibook/page/sign_in/signIn.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      MultiBlocProvider(
        providers: AppBlocProviders.allBlocProviders,
        child: ScreenUtilInit(
          builder: (context, child) =>
           MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(
                  color: Colors.black,
                  
                ),
                elevation: 0,
                backgroundColor: Colors.white
              )
            ),
            home: const Welcome(),
            routes:{
              "/home": (context) => const HomeScreen(),
              "/signIn": (context) => const SignIn(),
              "/register": (context) => const Register(),
            },
          ),
        ),
      );
  }
}

