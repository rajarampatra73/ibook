part of 'register_bloc.dart';

@immutable
class RegisterState {
  final String userName;
  final String email;
  final String password;
  final String confirmPassword;

  const RegisterState(
      {this.userName = "",
      this.email = "",
      this.password = "",
      this.confirmPassword = ""});

  RegisterState copyWith(
      {String? email,
      String? password,
      String? userName,
      String? confirmPassword}) {
    return RegisterState(
        userName: userName ?? this.userName,
        email: email ?? this.email,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword);
  }
}
