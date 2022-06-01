import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:management/Views/employeeScreen/employeeScreen.dart';
import 'package:management/Widgets/customText.dart';
/*
class OverTimeView extends StatelessWidget {
  static const String routeName = "/OvertimeEmployeeView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue[800],
        title: customText(
            "Overtime Attendance", Colors.white, 16.sp, FontWeight.w600),
        actions: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: const Icon(Icons.check),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(left: 12.w, right: 12.w),
            child: InkWell(
              onTap: () {
                Get.to(const EmployeeList());
              },
              child: Container(
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 10.w),
                    const Icon(
                      Icons.person,
                      size: 26,
                    ),
                    SizedBox(width: 12.w),
                    */
/*Text(countrys == null
                        ? "Select  (Optional)"
                        : countrys.displayName),*/
/*

                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(left: 12.w, right: 12.w),
            child: TextFormField(
              keyboardType: TextInputType.datetime,
              cursorColor: Colors.grey,
              inputFormatters: [
                LengthLimitingTextInputFormatter(15),
              ],
              decoration: InputDecoration(
                hintText: "Overtime Date",
                label: customText("Overtime Date".toUpperCase(), Colors.grey,
                    12.sp, FontWeight.w700),
                prefixIcon: const Icon(
                  Icons.calendar_today_outlined,
                  color: Colors.black,
                  size: 26,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 0.0),
                ),
                border: const OutlineInputBorder(),
              ),
              onChanged: (numb) {
                //number = numb;
                //adminData.number = numb;
              },
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter Mobile Number";
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(left: 12.w, right: 12.w),
            child: TextFormField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(2),
              ],
              keyboardType: TextInputType.datetime,
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                hintText: "Overtime Hours",
                label: customText("Overtime Hours".toUpperCase(), Colors.grey,
                    12.sp, FontWeight.w700),
                prefixIcon: const Icon(
                  Icons.timer,
                  color: Colors.black,
                  size: 26,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 0.0),
                ),
                border: const OutlineInputBorder(),
              ),
              onChanged: (numb) {
                //number = numb;
                //adminData.number = numb;
              },
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter Mobile Number";
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(left: 12.w, right: 12.w),
            child: TextFormField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(4),
              ],
              keyboardType: TextInputType.datetime,
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                hintText: "Overtime Amount",
                label: customText("Overtime Amount".toUpperCase(), Colors.grey,
                    12.sp, FontWeight.w700),
                prefixIcon: const Icon(
                  Icons.money,
                  color: Colors.black,
                  size: 26,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 0.0),
                ),
                border: const OutlineInputBorder(),
              ),
              onChanged: (numb) {
                //number = numb;
                //adminData.number = numb;
              },
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter Mobile Number";
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(left: 12.w, right: 12.w),
            child: TextFormField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(30),
              ],
              keyboardType: TextInputType.datetime,
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                hintText: "Note Optional",
                label: customText("Note Optional".toUpperCase(), Colors.grey,
                    12.sp, FontWeight.w700),
                prefixIcon: const Icon(
                  Icons.sticky_note_2_outlined,
                  color: Colors.black,
                  size: 26,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 0.0),
                ),
                border: const OutlineInputBorder(),
              ),
              onChanged: (numb) {
                //number = numb;
                //adminData.number = numb;
              },
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter Mobile Number";
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
*/

class OverTimeView extends StatefulWidget {
  static const String routeName = "/OvertimeEmployeeView";

  const OverTimeView({Key key}) : super(key: key);

  @override
  State<OverTimeView> createState() => _OverTimeViewState();
}

class _OverTimeViewState extends State<OverTimeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue[800],
        title: customText(
            "Overtime Attendance", Colors.white, 16.sp, FontWeight.w600),
        actions: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: const Icon(Icons.check),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(left: 12.w, right: 12.w),
            child: InkWell(
              onTap: () {
                Get.to(const EmployeeList());
              },
              child: Container(
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 10.w),
                    const Icon(
                      Icons.person,
                      size: 26,
                    ),
                    SizedBox(width: 12.w),
                    /*Text(countrys == null
                        ? "Select  (Optional)"
                        : countrys.displayName),*/
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(left: 12.w, right: 12.w),
            child: TextFormField(
              keyboardType: TextInputType.datetime,
              cursorColor: Colors.grey,
              inputFormatters: [
                LengthLimitingTextInputFormatter(15),
              ],
              decoration: InputDecoration(
                hintText: "Overtime Date",
                label: customText("Overtime Date".toUpperCase(), Colors.grey,
                    12.sp, FontWeight.w700),
                prefixIcon: const Icon(
                  Icons.calendar_today_outlined,
                  color: Colors.black,
                  size: 26,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 0.0),
                ),
                border: const OutlineInputBorder(),
              ),
              onChanged: (numb) {
                //number = numb;
                //adminData.number = numb;
              },
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter Mobile Number";
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(left: 12.w, right: 12.w),
            child: TextFormField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(2),
              ],
              keyboardType: TextInputType.datetime,
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                hintText: "Overtime Hours",
                label: customText("Overtime Hours".toUpperCase(), Colors.grey,
                    12.sp, FontWeight.w700),
                prefixIcon: const Icon(
                  Icons.timer,
                  color: Colors.black,
                  size: 26,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 0.0),
                ),
                border: const OutlineInputBorder(),
              ),
              onChanged: (numb) {
                //number = numb;
                //adminData.number = numb;
              },
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter Mobile Number";
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(left: 12.w, right: 12.w),
            child: TextFormField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(4),
              ],
              keyboardType: TextInputType.datetime,
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                hintText: "Overtime Amount",
                label: customText("Overtime Amount".toUpperCase(), Colors.grey,
                    12.sp, FontWeight.w700),
                prefixIcon: const Icon(
                  Icons.money,
                  color: Colors.black,
                  size: 26,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 0.0),
                ),
                border: const OutlineInputBorder(),
              ),
              onChanged: (numb) {
                //number = numb;
                //adminData.number = numb;
              },
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter Mobile Number";
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(left: 12.w, right: 12.w),
            child: TextFormField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(30),
              ],
              keyboardType: TextInputType.datetime,
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                hintText: "Note Optional",
                label: customText("Note Optional".toUpperCase(), Colors.grey,
                    12.sp, FontWeight.w700),
                prefixIcon: const Icon(
                  Icons.sticky_note_2_outlined,
                  color: Colors.black,
                  size: 26,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 0.0),
                ),
                border: const OutlineInputBorder(),
              ),
              onChanged: (numb) {
                //number = numb;
                //adminData.number = numb;
              },
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter Mobile Number";
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
