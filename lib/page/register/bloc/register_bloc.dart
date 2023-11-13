import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<EmailEvent>(_emailEvent);
    on<UserNameEvent>(_userEvent);
    on<PasswordEvent>(_passwordEvent);
    on<ConfirmPasswordEvent>(_ConfirmPasswordEvent);
  }
  void _userEvent(UserNameEvent event, Emitter<RegisterState> emit ) {
    emit(state.copyWith(userName: event.uesrName));

  }
  void _emailEvent(EmailEvent event, Emitter<RegisterState> emit ) {
    emit(state.copyWith(email: event.email));

  }
  void _passwordEvent(PasswordEvent event, Emitter<RegisterState> emit ) {
    emit(state.copyWith(password: event.password));

  }
  void _ConfirmPasswordEvent(ConfirmPasswordEvent event, Emitter<RegisterState> emit ) {
    emit(state.copyWith(confirmPassword: event.confirmPassword));

  }
}
