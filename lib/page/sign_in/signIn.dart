
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibook/page/sign_in/sign_in_controller.dart';
import 'package:ibook/page/sign_in/widgets/buildTextField.dart';
import 'package:ibook/page/sign_in/widgets/buildThirdPartyLogin.dart';
import 'package:ibook/page/sign_in/widgets/forgotPass.dart';
import 'package:ibook/page/sign_in/widgets/reuseableText.dart';
import 'package:ibook/page/sign_in/widgets/sign_in_appBar.dart';
import 'bloc/sign_in_bloc.dart';


class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context , state){
      return
        Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(1.0),
                child: Container(
                  color: Colors.grey.withOpacity(0.5),
                  height: 1.0,
                ),
              ),
              title: Center(
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.black ,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),

            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildThirdPartyLogin(image: "google", onTap: () {}),
                      buildThirdPartyLogin(image: "apple", onTap: () {}),
                      buildThirdPartyLogin(image: "facebook", onTap: () {}),
                    ],
                  ),
                  Center(
                      child: reuseableText(
                          text: "Or Login with your Email",
                          color: Colors.grey.withOpacity(0.5))),
                  Container(
                    margin: EdgeInsets.only(top: 36.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reuseableText(
                            text: "Email", color: Colors.grey.withOpacity(0.5)),
                        buildTextField(
                          image: "user",
                          hintText: "email",
                          textType: "email",
                          function: (value){ context.read<SignInBloc>().add(EmailEvent(value));}
                        ),
                        reuseableText(
                            text: "Password",
                            color: Colors.grey.withOpacity(0.5)),
                        buildTextField(
                          image: "lock",
                          hintText: "email",
                          textType: "password",
                            function: (value){ context.read<SignInBloc>().add(PasswordEvent(value));}
                        )
                      ],
                    ),
                  ),
                  forgotPassword(text: "Forgot Password",),

                  buildLogInButton(color: Colors.blue, text: "Log In",function: (){
                    SignInController(context: context).handleSignIn("email");
                  },),
                  buildLogInButton(color: Colors.green, text: "Register", function: (){

                    Navigator.of(context).pushNamed("/register");
                  },),
                ],
              ),
            ),
          ),
        ),
      );
    });


  }
}
