import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibook/page/sign_in/bloc/sign_in_bloc.dart';

import '../../common/value/flutter_toast.dart';

class SignInController {
  final BuildContext context;

  const SignInController ({required this.context});

  void handleSignIn(String type) async {
    try {
      if(type =="email"){
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String passwordAddress = state.password;

        if(emailAddress.isEmpty){
          // sms
          toastInfo(msg: 'Your Email Address is empty');
          return;
        }if(passwordAddress.isEmpty){
          // sms
          toastInfo(msg: 'Your Password is empty');
          return;

        }

        try {
          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword
            (email: emailAddress, password: passwordAddress);
        if(credential.user==null){
          toastInfo(msg: 'User Not Found');
          return;


        }
        if(!credential.user!.emailVerified){
          // not sms available
          toastInfo(msg: "Your need to Verified your Email Account");
          return;

        }
        var user = credential.user;
        if(user!= null){
          // verify email
          //toastInfo(msg: "Your need to Verified your Email Account");

        }else{
          toastInfo(msg: "Email Account Not a Register");
          return;

        }

        } on FirebaseAuthException catch (e){
          if(e.code == 'user-not-found'){
            toastInfo(msg: "User not found on this Email Account");

          }else if(e.code == 'wrong-password'){
            toastInfo(msg: "Wrong Password Given");

          }else if(e.code == 'invalid-email'){
            toastInfo(msg: "Your Email Address is invalid");

          }

        }
      }
    }catch(e) {

    }
  }
}