import 'package:bloc/bloc.dart';
import 'package:ibook/AppBloc/app_bloc.dart';

class AppBlocs extends Bloc<AppEvent, AppState> {
  AppBlocs(): super(AppInitial());
}