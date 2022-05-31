import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:management/Views/AdminScr/AdminScr.dart';
import 'package:management/Views/parameters/parameters.dart';
import 'package:management/Widgets/customText.dart';

class SettingsScr extends StatefulWidget {
  static const String routeName = "/SettingsScrView";
  const SettingsScr({Key key}) : super(key: key);

  @override
  State<SettingsScr> createState() => _SettingsScrState();
}

class _SettingsScrState extends State<SettingsScr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        elevation: 0,
        title: Text(
          "Settings",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16.sp),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 15.h),
          Padding(
            padding: EdgeInsets.only(right: 200.w),
            child: customText("general Settings".toUpperCase(), Colors.grey,
                13.sp, FontWeight.w500),
          ),
          //SizedBox(height: 15.h),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 333.h,
              width: 350.w,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(const AdminScrView());
                    },
                    child: ListTile(
                      leading: customText("Update Admin Profile", Colors.black,
                          14.sp, FontWeight.w500),
                      trailing: const Icon(Icons.navigate_next_sharp),
                    ),
                  ),
                  Divider(height: 1.h, color: Colors.black),
                  SizedBox(height: 5.h),
                  InkWell(
                    onTap: () {
                      Get.to(const SetParametersScr());
                    },
                    child: ListTile(
                      leading: customText("Set Parameters", Colors.black, 14.sp,
                          FontWeight.w500),
                      trailing: const Icon(Icons.navigate_next_sharp),
                    ),
                  ),
                  Divider(height: 1.h, color: Colors.black),
                  SizedBox(height: 5.h),
                  ListTile(
                    leading: customText(
                        "Working Hours", Colors.black, 14.sp, FontWeight.w500),
                    trailing: const Icon(Icons.navigate_next_sharp),
                  ),
                  Divider(height: 1.h, color: Colors.black),
                  SizedBox(height: 5.h),
                  ListTile(
                    leading: customText("Select Currency", Colors.black, 14.sp,
                        FontWeight.w500),
                    trailing: const Icon(Icons.navigate_next_sharp),
                  ),
                  Divider(height: 1.h, color: Colors.black),
                  SizedBox(height: 5.h),
                  ListTile(
                    leading: customText(
                        "Date Format", Colors.black, 14.sp, FontWeight.w500),
                    trailing: const Icon(Icons.navigate_next_sharp),
                  ),
                  Divider(height: 1.h, color: Colors.black),
                  SizedBox(height: 5.h),
                  ListTile(
                    leading: customText(
                        "Clear All Data", Colors.black, 14.sp, FontWeight.w500),
                    trailing: const Icon(Icons.navigate_next_sharp),
                  ),
                  //Divider(height: 1, color: Colors.black),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
