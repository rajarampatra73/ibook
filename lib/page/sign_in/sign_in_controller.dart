import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibook/page/sign_in/bloc/sign_in_bloc.dart';

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
        }if(passwordAddress.isEmpty){
          // sms
        }

        try {
          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword
            (email: emailAddress, password: passwordAddress);
        if(credential.user==null){

        }
        if(!credential.user!.emailVerified){
          // not sms available
        }
        var user = credential.user;
        if(user!= null){
          // verify email
        }else{

        }

        } on FirebaseAuthException catch (e){
          if(e.code == 'user-not-found'){

          }else if(e.code == 'wrong-password'){

          }else if(e.code == 'invalid-email'){}

        }
      }
    }catch(e) {

    }
  }
}