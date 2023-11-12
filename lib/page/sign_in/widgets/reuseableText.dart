import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
Widget reuseableText({String? text, Color? color}) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text!,
      style: TextStyle(
        color: color,
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}