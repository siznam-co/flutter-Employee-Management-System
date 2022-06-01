import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:management/Widgets/customText.dart';
/*class GenerateReport extends StatelessWidget {
  static const String routeName = "/GenerateReportView";
  int indexx = 1;

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
        title: Padding(
          padding: EdgeInsets.only(left: 13.0.w),
          child: customText(
              "All Generated Report", Colors.white, 17.sp, FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 70.h,
            width: double.infinity,
            color: Colors.blue[800],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    indexx = 1;
                    print(indexx);
                    //setState(() {});
                  },
                  child: Container(
                    height: 45.h,
                    width: 140.w,
                    color: indexx == 1 ? Colors.blue : Colors.green,
                    child: Center(
                      child: customText(
                          "Summary", Colors.white, 17.sp, FontWeight.w500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    indexx = 2;
                    print(indexx);
                    //setState(() {});
                  },
                  child: Container(
                    height: 45.h,
                    width: 140.w,
                    color: indexx == 2 ? Colors.blue : Colors.green,
                    child: Center(
                      child: customText(
                          "Attendance", Colors.white, 17.sp, FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}*/

class GenerateReport extends StatefulWidget {
  static const String routeName = "/GenerateReportView";
  const GenerateReport({Key key}) : super(key: key);

  @override
  State<GenerateReport> createState() => _GenerateReportState();
}

class _GenerateReportState extends State<GenerateReport> {
  @override
  int indexx = 1;
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
              "All Generated Report", Colors.white, 17.sp, FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 70.h,
            width: double.infinity,
            color: Colors.blue[800],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    indexx = 1;
                    print(indexx);
                    setState(() {});
                  },
                  child: Container(
                    height: 45.h,
                    width: 140.w,
                    color: indexx == 1 ? Colors.blue : Colors.green,
                    child: Center(
                      child: customText(
                          "Summary", Colors.white, 17.sp, FontWeight.w500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    indexx = 2;
                    print(indexx);
                    setState(() {});
                  },
                  child: Container(
                    height: 45.h,
                    width: 140.w,
                    color: indexx == 2 ? Colors.blue : Colors.green,
                    child: Center(
                      child: customText(
                          "Attendance", Colors.white, 17.sp, FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
