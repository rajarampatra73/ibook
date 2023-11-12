import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibook/page/sign_in/widgets/buildTextField.dart';
import 'package:ibook/page/sign_in/widgets/buildThirdPartyLogin.dart';
import 'package:ibook/page/sign_in/widgets/forgotPass.dart';
import 'package:ibook/page/sign_in/widgets/reuseableText.dart';
import 'package:ibook/page/sign_in/widgets/sign_in_appBar.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(),
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
                      ),
                      reuseableText(
                          text: "Password",
                          color: Colors.grey.withOpacity(0.5)),
                      buildTextField(
                        image: "lock",
                        hintText: "email",
                        textType: "password",
                      )
                    ],
                  ),
                ),
                forgotPassword(text: "Forgot Password",),

                buildLogInButton(color: Colors.blue, text: "Log In",),
                buildLogInButton(color: Colors.grey, text: "Register",),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
