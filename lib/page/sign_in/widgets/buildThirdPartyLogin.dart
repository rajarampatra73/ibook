import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


Widget buildThirdPartyLogin({
  required String image,
  onTap,
}) {
  return Container(
      margin: EdgeInsets.only(
        top: 40.h,
        bottom: 20.h,
      ),
      padding: EdgeInsets.only(left: 25.w,right: 25.w),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 40.w,
          height: 40.w,
          child: Image.asset("assets/icons/$image.png"),
        ),
      ));
}