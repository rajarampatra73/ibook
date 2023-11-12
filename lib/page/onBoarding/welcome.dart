import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibook/page/onBoarding/bloc/welcome_bloc.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController _controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(body: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 34.h),
            width: 375.w,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  controller:  _controller,
                  onPageChanged: (index) {
                    state.page = index;
                    BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                  },
                  children: [
                    _pages(
                        index: 1,
                        context: context,
                        title: "Welcome",
                        subtitle:
                            "Discover new stories, books & more updates every day.",
                        btnName: "Next",
                        imgPath: "assets/images/reading.png"),
                    _pages(
                        index: 2,
                        context: context,
                        title: "Browse ",
                        subtitle:
                            "We connect you to your favorite Book, podcast, and more you all the best deals in one place.",
                        btnName: "Next",
                        imgPath: "assets/images/boy.png"),
                    _pages(
                        index: 3,
                        context: context,
                        title: "Ready",
                        subtitle:
                            "Find the Favourite Story, e-book, and more for you.",
                        btnName: "Get Started",
                        imgPath: "assets/images/man.png"),
                  ],
                ),
                Positioned(
                    bottom: 20.h,
                    child: DotsIndicator(
                      // get Double value == state.page.toDouble()
                      position: state.page,
                      decorator: DotsDecorator(
                          color: Colors.grey,
                          activeColor: Colors.red,
                          size: Size.square(8.0),
                          activeSize: Size(18.0, 8.0),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      mainAxisAlignment: MainAxisAlignment.center,
                      dotsCount: 3,
                    ))
              ],
            ),
          );
        },
      )),
    );
  }

//----------------------------------------------------------------
  Widget _pages(
      {required int index,
      required BuildContext context,
      String? btnName,
      String? title,
      String? subtitle,
      required String imgPath}) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(
            imgPath,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: Text(
            title!,
            style: TextStyle(
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subtitle!,
            style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              _controller.animateToPage(index,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.decelerate);
            } else {

              Navigator.of(context).pushNamedAndRemoveUntil("/signIn", (route) => false);
             // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ));
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: Colors.cyan,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(15.w))),
            child: Center(
              child: Text(
                btnName!,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        )
      ],
    );
  }
}
