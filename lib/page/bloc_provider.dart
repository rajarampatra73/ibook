
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibook/page/register/bloc/register_bloc.dart';
import 'package:ibook/page/sign_in/bloc/sign_in_bloc.dart';

import 'homeScreen/bloc/home_bloc.dart';
import 'onBoarding/bloc/welcome_bloc.dart';

class AppBlocProviders{
  static get allBlocProviders=>[
    // lazy = creation of the bloc as soon as possible
    BlocProvider(create: (context) => WelcomeBloc(),),
    BlocProvider(lazy: false, create: (context) => HomeBloc(),),
    BlocProvider(create: (context) => SignInBloc(),),
    BlocProvider(create: (context) => RegisterBloc(),),
  ];
}