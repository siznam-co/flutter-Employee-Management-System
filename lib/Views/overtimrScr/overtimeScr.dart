import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:management/Views/addEmpScr/addEmpScr.dart';
import 'package:management/Widgets/customText.dart';
/*
class OverTimeScr extends StatelessWidget {
  static const String routeName = "/OverTimeScrView";
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[800],
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Get.back(),
          ),
          title: customText(
              "Overtime Employees", Colors.white, 17.sp, FontWeight.w700),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Get.to(AddEmployeeView());
                },
                child: Container(
                  //height: 1.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: Colors.blue[500],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.access_time,
                      ),
                      SizedBox(width: 6.w),
                      customText(
                          "ADD Overtime", Colors.white, 11, FontWeight.normal)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              height: 100.h,
              width: double.infinity,
              color: Colors.blue[800],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 10.h),
                      customText("From", Colors.white, 17, FontWeight.w500),
                      SizedBox(height: 5.h),
                      InkWell(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: Container(
                          height: 45.h,
                          width: 150.w,
                          color: Colors.white,
                          child: Center(
                            child: Text(
                              "${selectedDate.toLocal()}".split(' ')[0],
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: 10.h),
                      customText("To", Colors.white, 17, FontWeight.w500),
                      SizedBox(height: 5.h),
                      InkWell(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: Container(
                          height: 45.h,
                          width: 150.w,
                          color: Colors.white,
                          child: Center(
                            child: Text(
                              "${selectedDate.toLocal()}".split(' ')[0],
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      */
/*setState(() {
        selectedDate = picked;
      });*/ /*

    }
  }
}
*/

class OverTimeScr extends StatefulWidget {
  static const String routeName = "/OverTimeScrView";
  const OverTimeScr({Key key}) : super(key: key);

  @override
  State<OverTimeScr> createState() => _OverTimeScrState();
}

class _OverTimeScrState extends State<OverTimeScr> {
  @override
  DateTime selectedDate = DateTime.now();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[800],
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Get.back(),
          ),
          title: customText(
              "Overtime Employees", Colors.white, 17.sp, FontWeight.w700),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Get.to(AddEmployeeView());
                },
                child: Container(
                  //height: 1.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: Colors.blue[500],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.access_time,
                      ),
                      SizedBox(width: 6.w),
                      customText(
                          "ADD Overtime", Colors.white, 11, FontWeight.normal)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              height: 100.h,
              width: double.infinity,
              color: Colors.blue[800],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 10.h),
                      customText("From", Colors.white, 17, FontWeight.w500),
                      SizedBox(height: 5.h),
                      InkWell(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: Container(
                          height: 45.h,
                          width: 150.w,
                          color: Colors.white,
                          child: Center(
                            child: Text(
                              "${selectedDate.toLocal()}".split(' ')[0],
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: 10.h),
                      customText("To", Colors.white, 17, FontWeight.w500),
                      SizedBox(height: 5.h),
                      InkWell(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: Container(
                          height: 45.h,
                          width: 150.w,
                          color: Colors.white,
                          child: Center(
                            child: Text(
                              "${selectedDate.toLocal()}".split(' ')[0],
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
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
