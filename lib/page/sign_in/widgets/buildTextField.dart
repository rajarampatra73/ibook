import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildTextField({String? hintText, String? textType , required String image,
void Function(String value)? function
}) {
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(bottom: 20.h,top: 5.h),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15.w)),
        border: Border.all(color: Colors.black)),
    child: Row(
      children: [
        Container(
          width: 18.w,
          height: 18.w,
          margin: EdgeInsets.only(left: 17.w),
          child: Image.asset("assets/icons/$image.png"),
        ),
        Container(
          width: 270.w,
          height: 50.h,
          child: TextField(
            onChanged: (value)=>function!(value) ,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                hintText: textType!,
                border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    )
                ),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    )
                ),
                disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    )),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    )),
                hintStyle: TextStyle(
                    color:  Colors.grey.withOpacity(0.5)
                )
            ),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 16.sp,
            ),
            autocorrect: false,
            obscureText: textType=="password"?true:false ,
          ),

        )
      ],
    ),
  );
}
