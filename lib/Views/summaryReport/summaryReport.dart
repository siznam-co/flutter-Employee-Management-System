import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:management/Widgets/customText.dart';

class SummaryReportScr extends StatefulWidget {
  static const String routeName = "/SummaryReportScrView";
  const SummaryReportScr({Key key}) : super(key: key);

  @override
  State<SummaryReportScr> createState() => _SummaryReportScrState();
}

class _SummaryReportScrState extends State<SummaryReportScr> {
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
        title: Padding(
          padding: EdgeInsets.only(left: 13.0.w),
          child: customText(
              "Summary Report", Colors.white, 17.sp, FontWeight.w700),
        ),
        actions: [
          const Icon(
            Icons.filter_list_alt,
            color: Colors.white,
            size: 28,
          ),
          SizedBox(width: 22.w),
          const Icon(
            Icons.more_vert,
            color: Colors.white,
            size: 28,
          ),
        ],
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
