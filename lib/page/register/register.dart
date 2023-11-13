import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibook/page/register/bloc/register_bloc.dart';

import '../sign_in/widgets/buildTextField.dart';
import '../sign_in/widgets/reuseableText.dart';
import '../sign_in/widgets/sign_in_appBar.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar(title: "Register"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                      child: reuseableText(
                          text:
                              "Register your details & get started to free using",
                          color: Colors.grey.withOpacity(0.8))),
                  Container(
                    margin: EdgeInsets.only(top: 36.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reuseableText(
                            text: "User name",
                            color: Colors.grey.withOpacity(0.5)),
                        buildTextField(
                            image: "user",
                            hintText: "Enter your User name",
                            textType: "Enter your User name",
                            function: (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(UserNameEvent(value));
                            }),
                        reuseableText(
                            text: "Email", color: Colors.grey.withOpacity(0.5)),
                        buildTextField(
                          image: "user",
                          hintText: "email",
                          textType: "email",
                           function: (value){ context.read<RegisterBloc>().add(EmailEvent(value));}
                        ),
                        reuseableText(
                            text: "Password",
                            color: Colors.grey.withOpacity(0.5)),
                        buildTextField(
                          image: "lock",
                          hintText: "email",
                          textType: "password",
                            function: (value){ context.read<RegisterBloc>().add(PasswordEvent(value));}
                        ),
                        reuseableText(
                            text: "Confirm Password",
                            color: Colors.grey.withOpacity(0.5)),
                        buildTextField(
                          image: "lock",
                          hintText: "email",
                          textType: "Confirm password",
                           function: (value){ context.read<RegisterBloc>().add(ConfirmPasswordEvent(value));}
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25.w),
                    child: reuseableText(
                        text:
                            "By creating a new account, you will be accepted our term and condition",
                        color: Colors.grey.withOpacity(0.9)),
                  ),
                  buildLogInButton(
                    color: Colors.green,
                    text: "Register",
                    function: () {
                      // Navigator.of(context).pushNamed("/register");
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
