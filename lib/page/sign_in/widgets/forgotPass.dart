
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget forgotPassword({String? text}){

  return
      Container(
        margin: EdgeInsets.only(left: 25.w),
        width: 260.w,
        height: 44.h,
        child: GestureDetector(
          onTap: (){},
          child: Text(text!,
          style: TextStyle(
            color: Colors.black,
            decoration: TextDecoration.underline,
            decorationColor: Colors.blue,
            fontSize: 14.sp
          ),),
        ),
      );
}