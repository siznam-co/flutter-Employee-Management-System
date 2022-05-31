import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:management/Views/attendanceReport/attendanceReport.dart';
import 'package:management/Views/employeeScreen/employeeScreen.dart';
import 'package:management/Views/generateReports/generateReports.dart';
import 'package:management/Views/markAttendanceEmpList/markAttendanceEmpList.dart';
import 'package:management/Views/overtimrScr/overtimeScr.dart';
import 'package:management/Views/settingsScr/settingScr.dart';
import 'package:management/Views/summaryReport/summaryReport.dart';
import 'package:management/Widgets/customText.dart';

class DashBoardView extends StatefulWidget {
  static const String routeName = "/DashBoardView";
  const DashBoardView({Key key}) : super(key: key);

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  @override
  void initState() {
    getData();
  }

  var adminData;
  final CollectionReference collectionRef =
      FirebaseFirestore.instance.collection("Admin Info");
  Future getData() async {
    print("get Data Called");
    try {
      adminData = await collectionRef.doc("AdminSide").get();
      return adminData;
    } catch (e) {
      debugPrint("Error - $e");
      return e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        elevation: 0,
        title: Text(
          "Employee Management System",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16.sp),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8.0.w, bottom: 3.h),
            child: const Icon(
              Icons.lock,
              color: Colors.white,
              size: 25,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 200.h,
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(1, 1), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.r),
                  bottomRight: Radius.circular(30.r),
                ),
                color: Colors.blue[800],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(const EmployeeList());
                    },
                    child: Container(
                      height: 100.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 1.r,
                            blurRadius: 1.r,
                            offset: Offset(2, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/avatar.png",
                            height: 35.h,
                            width: 35.w,
                            color: Colors.blue[800],
                          ),
                          Text(
                            "Employee",
                            style: TextStyle(
                              color: Colors.blue[800],
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "List",
                            style: TextStyle(
                              color: Colors.blue[800],
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const MarkAttendanceList());
                    },
                    child: Container(
                      height: 100.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 1.r,
                            blurRadius: 1.r,
                            offset: Offset(2, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/attendance.png",
                            height: 35.h,
                            width: 35.w,
                            color: Colors.blue[800],
                          ),
                          Text(
                            "Mark",
                            style: TextStyle(
                              color: Colors.blue[800],
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Attendance",
                            style: TextStyle(
                              color: Colors.blue[800],
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 400.h,
              width: 330.w,
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Container(
                    height: 360.h,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset:
                              const Offset(1, 1), // changes position of shadow
                        ),
                      ],
                      /*borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),*/
                      color: Colors.white,
                    ),
                    child: ListView(
                      padding: EdgeInsets.all(20.r),
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(const AttendanceReportScr());
                          },
                          child: Container(
                            height: 60.h,
                            width: 300.w,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1.r,
                                  blurRadius: 1.r,
                                  offset: const Offset(
                                      1, 1), // changes position of shadow
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Center(
                              child: ListTile(
                                leading: Image.asset(
                                  'assets/attendance_report.png',
                                  color: Colors.blue[800],
                                  height: 70.h,
                                  width: 40.w,
                                ),
                                title: customText("  Attendance Report",
                                    Colors.blue[800], 17.sp, FontWeight.w500),
                                trailing: Icon(
                                  Icons.navigate_next_outlined,
                                  color: Colors.blue[800],
                                  size: 25,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 21.h),
                        InkWell(
                          onTap: () {
                            Get.to(const SummaryReportScr());
                          },
                          child: Container(
                            height: 60.h,
                            width: 300.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: const Offset(
                                      1, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Center(
                              child: ListTile(
                                leading: Image.asset(
                                  'assets/summaryReport.png',
                                  color: Colors.blue[800],
                                  height: 50.h,
                                  width: 50.w,
                                ),
                                title: customText("Summary Report",
                                    Colors.blue[800], 17.sp, FontWeight.w500),
                                trailing: Icon(
                                  Icons.navigate_next_outlined,
                                  size: 30,
                                  color: Colors.blue[800],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 21.h),
                        InkWell(
                          onTap: () {
                            Get.to(const GenerateReport());
                          },
                          child: Container(
                            height: 60.h,
                            width: 300.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: const Offset(
                                      1, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Center(
                              child: ListTile(
                                leading: Image.asset(
                                  'assets/generateReports.png',
                                  color: Colors.blue[800],
                                  height: 45.h,
                                  width: 45.w,
                                ),
                                title: customText(" Generate Report",
                                    Colors.blue[800], 17.sp, FontWeight.w500),
                                trailing: Icon(
                                  Icons.navigate_next_outlined,
                                  size: 30,
                                  color: Colors.blue[800],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 21.h),
                        InkWell(
                          onTap: () {
                            Get.to(const OverTimeScr());
                          },
                          child: Container(
                            height: 70.h,
                            width: 320.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: const Offset(
                                      1, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Center(
                              child: ListTile(
                                leading: Image.asset(
                                  'assets/overtime.png',
                                  color: Colors.blue[800],
                                  height: 50.h,
                                  width: 50.w,
                                ),
                                title: customText("Overtime Employes",
                                    Colors.blue[800], 17.sp, FontWeight.w500),
                                trailing: Icon(
                                  Icons.navigate_next_outlined,
                                  size: 30,
                                  color: Colors.blue[800],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      drawer: SizedBox(
        width: 330.w,
        child: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 160.h,
                child: DrawerHeader(
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/avatar.png",
                        color: Colors.white,
                        height: 60.h,
                        width: 60.w,
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 50.0.w),
                            child: Text(
                              'Employee Management System',
                              style: GoogleFonts.alegreyaSans(
                                color: Colors.white,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 108.0.w),
                            child: Text(
                              'Staff Attendance',
                              style: GoogleFonts.alegreyaSans(
                                color: Colors.white,
                                fontSize: 17.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue[800],
                  ),
                ),
              ),
              ListTile(
                leading: Image.asset(
                  "assets/setting_icon.png",
                  height: 30.h,
                  width: 30.w,
                ),
                title: customText(
                    "Settings", Colors.black, 17.sp, FontWeight.w500),
                trailing: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.black,
                ),
                onTap: () {
                  Get.to(const SettingsScr());
                },
              ),
              SizedBox(
                height: 5.h,
              ),
              ListTile(
                leading: Image.asset(
                  "assets/backUp.png",
                  height: 30.h,
                  width: 30.w,
                ),
                title: customText(
                    "Backup and Restore", Colors.black, 17.sp, FontWeight.w500),
                trailing: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.black,
                ),
                onTap: () {
                  getData();
                  print(adminData);
                  print(adminData['companyName']);
                },
              ),
              SizedBox(
                height: 5.h,
              ),
              ListTile(
                leading: Image.asset(
                  "assets/premierIcon.png",
                  height: 30.h,
                  width: 30.w,
                ),
                title: customText(
                    "Backup and Restore", Colors.black, 17.sp, FontWeight.w500),
                trailing: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.black,
                ),
                onTap: () {
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
