import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:management/Views/dashBoard/DashBoard.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/SplashScreenView";
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Get.offAll(
        const DashBoardView(),
        transition: Transition.rightToLeftWithFade,
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 150.h),
            Text(
              "Employee Management",
              style: GoogleFonts.alegreyaSans(
                color: Colors.white,
                fontSize: 35.sp,
                shadows: [
                  Shadow(
                    blurRadius: 3.0.r,
                    color: Colors.black45,
                    offset: const Offset(2.0, 5.0),
                  ),
                ],
              ),
            ),
            Text(
              "System",
              style: GoogleFonts.alegreyaSans(
                color: Colors.white,
                fontSize: 35.sp,
                shadows: [
                  Shadow(
                    blurRadius: 3.0.r,
                    color: Colors.black45,
                    offset: Offset(2.0, 5.0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 200.h),
            Padding(
              padding: EdgeInsets.only(right: 16.0.h),
              child: Image.asset("assets/splash.png"),
            ),
          ],
        ),
      ),
    );
  }
}
