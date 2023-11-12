import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibook/common/value/colores.dart';

AppBar buildAppBar() {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(1.0),
      child: Container(
        color: Colors.grey.withOpacity(0.5),
        height: 1.0,
      ),
    ),
    title: Center(
      child: Text(
        "Log In",
        style: TextStyle(
          color: black ,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
  );
}


Widget buildLogInButton({String? text, Color? color}) {
  return GestureDetector(
    onTap: (){},
    child: Container(
      margin: EdgeInsets.only(left: 25.w,
      right: 25.w, top: 20.h),
      width: 325.w,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.w),
        boxShadow: [BoxShadow(
          spreadRadius: 1,
          blurRadius: 2,
          offset: Offset(0, 1),
          color: Colors.grey.withOpacity(0.4)
        )],
        color: color,
      ),
      child: Center(child: Text(text!,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),)),
    ),
  );
}
