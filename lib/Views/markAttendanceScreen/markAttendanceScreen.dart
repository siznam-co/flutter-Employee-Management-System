import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:management/Constants/MDattendance.dart';
import 'package:management/Widgets/customText.dart';

class MarkAttendanceEmp extends StatefulWidget {
  static const String routeName = "/MarkAttendanceEmpView";
  List empList = [];
  int index;
  MarkAttendanceEmp(this.empList, this.index, {Key key}) : super(key: key);

  @override
  State<MarkAttendanceEmp> createState() => _MarkAttendanceEmpState();
}

class _MarkAttendanceEmpState extends State<MarkAttendanceEmp> {
  @override
  String radioButtonItem = 'ONE';
  int id = 1;
  DateTime selectedDate = DateTime.now();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  AttendanceReport attendanceReport = AttendanceReport(
      empName: "",
      empId: "",
      attendanceStatus: "Present",
      inTime: "",
      outTime: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        InkWell(
          onTap: () {
            firestore
                .collection("AttendanceReports")
                .doc((DateTime.now().toString()).substring(0, 10))
                .collection("ALl Employees")
                .doc(widget.empList[widget.index]["empId"])
                .set({
                  "empName": widget.empList[widget.index]["empName"],
                  "empId": widget.empList[widget.index]["empId"],
                  "attendanceStatus": attendanceReport.attendanceStatus,
                  "inTime": (DateTime.now().toString()).substring(11, 19),
                  "outTime": "Later"
                })
                .then(
                  (value) => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Data Updated.!'),
                    ),
                  ),
                )
                .then((value) => Get.back());
          },
          child: Container(
            height: 45.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: Colors.blue[800],
            ),
            child: Center(
                child:
                    customText("Submit", Colors.black, 15.sp, FontWeight.w500)),
          ),
        ),
      ],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 13.0.w),
          child:
              customText("Employee List", Colors.white, 17.sp, FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 70.h,
            width: double.infinity,
            color: Colors.blue[800],
            child: Center(
              child: Container(
                height: 40.h,
                width: 170.w,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15.r)),
                child: Row(
                  children: [
                    SizedBox(width: 7.w),
                    const Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.white,
                      size: 28,
                    ),
                    SizedBox(width: 4.w),
                    const Icon(
                      Icons.arrow_back_ios_sharp,
                      color: Colors.white,
                      size: 20,
                    ),
                    InkWell(
                      onTap: () {
                        _selectDate(context);
                        print("Tapped");
                      },
                      child: Text(
                        "${selectedDate.toLocal()}".split(' ')[0],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Colors.white,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          ListTile(
            leading: Container(
              height: 50.h,
              width: 50.w,
              color:
                  Colors.primaries[Random().nextInt(Colors.primaries.length)],
              child: Center(
                child: Text(
                  '${widget.empList[widget.index]["empName"][0]}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            title: customText(widget.empList[widget.index]["empName"],
                Colors.black, 17.sp, FontWeight.w500),
            subtitle: customText(
                widget.empList[widget.index]["designation"],
                Colors.black,
                15.sp,
                FontWeight.w400) /*Text(empList[index]["designation"])*/,
            trailing: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customText(widget.empList[widget.index]["salaryType"],
                    Colors.black, 13.sp, FontWeight.w500),
                customText("Salary", Colors.blue, 15.sp, FontWeight.bold),
                customText(widget.empList[widget.index]["basicPay"],
                    Colors.blue, 15.sp, FontWeight.bold)
              ],
            ),
            onTap: () {
              //Get.to(MarkAttendanceEmp(empList, index));
            },
          ),
          const Divider(),
          SizedBox(height: 10.h),
          customText(
              "Attendance".toString(), Colors.black, 17.sp, FontWeight.w500),
          SizedBox(height: 30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                height: 40.h,
                width: 120.w,
                color: Colors.blue[100],
                child: Padding(
                  padding: EdgeInsets.only(right: 14.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Radio(
                        value: 1,
                        groupValue: id,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItem = 'Present';
                            attendanceReport.attendanceStatus = "Present";
                            id = 1;
                          });
                        },
                      ),
                      Text(
                        'Present',
                        style: TextStyle(fontSize: 15.sp),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 40.h,
                width: 120.w,
                color: Colors.blue[100],
                child: Padding(
                  padding: EdgeInsets.only(right: 14.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Radio(
                        value: 2,
                        groupValue: id,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItem = 'Absent';
                            attendanceReport.attendanceStatus = "Absent";
                            print(radioButtonItem);
                            id = 2;
                          });
                        },
                      ),
                      Text(
                        'Absent',
                        style: TextStyle(
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 40.h,
                width: 120.w,
                color: Colors.blue[100],
                child: Padding(
                  padding: EdgeInsets.only(right: 14.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Radio(
                        value: 3,
                        groupValue: id,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItem = 'Half Day';
                            attendanceReport.attendanceStatus = "Half Day";
                            print(radioButtonItem);
                            id = 3;
                          });
                        },
                      ),
                      Text(
                        'Half Day',
                        style: TextStyle(fontSize: 15.sp),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 40.h,
                width: 120.w,
                color: Colors.blue[100],
                child: Padding(
                  padding: EdgeInsets.only(right: 14.w),
                  child: Row(
                    children: [
                      Radio(
                        value: 4,
                        groupValue: id,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItem = 'Leave';
                            attendanceReport.attendanceStatus = "Leave";
                            print(radioButtonItem);
                            id = 4;
                          });
                        },
                      ),
                      Text(
                        'Leave',
                        style: TextStyle(fontSize: 15.sp),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 40.h,
                width: 120.w,
                color: Colors.blue[100],
                child: Padding(
                  padding: EdgeInsets.only(right: 14.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Radio(
                        value: 5,
                        groupValue: id,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItem = 'Five';
                            attendanceReport.attendanceStatus = "Holi day";
                            id = 5;
                          });
                        },
                      ),
                      Text(
                        'On Leave',
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 40.h,
                width: 120.w,
                color: Colors.blue[100],
                child: Padding(
                  padding: EdgeInsets.only(right: 14.w),
                  child: Row(
                    children: [
                      Radio(
                        value: 6,
                        groupValue: id,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItem = 'Six';
                            attendanceReport.attendanceStatus = "WFH";
                            id = 6;
                          });
                        },
                      ),
                      Text(
                        'WFH',
                        style: TextStyle(fontSize: 15.sp),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
