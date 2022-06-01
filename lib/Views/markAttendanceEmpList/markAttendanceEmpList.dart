import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:management/Views/markAttendanceScreen/markAttendanceScreen.dart';
import 'package:management/Widgets/customText.dart';
/*
class MarkAttendanceList extends StatelessWidget {
  static const String routeName = "/MarkAttendanceListView";
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List empList = [];
  DateTime selectedDate = DateTime.now();
  final CollectionReference collectionRef =
  FirebaseFirestore.instance.collection("Employees");
  Future getData() async {
    print("get Data Called");
    try {
      //to get data from a single/particular document alone.
      // var temp = await collectionRef.doc("<your document ID here>").get();

      // to get data from all documents sequentially
      await collectionRef.get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          empList.add(result.data());
        }
      });

      return empList;
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 13.0.w),
          child:
          customText("Employee List", Colors.white, 17.sp, FontWeight.w700),
        ),
        actions: const [
          Icon(
            Icons.search,
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
          Expanded(
            child: FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text(
                    "Something went wrong",
                  );
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  empList = snapshot.data as List;
                  return buildItems(empList);
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
            */
/*ListView.separated(
              padding: const EdgeInsets.all(0),
              itemCount: empList.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Container(
                    height: 50.h,
                    width: 50.w,
                    color: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                    child: const Center(child: Text("Get Image Here")),
                  ),
                  title: Text(
                    empList[index]["empName"],
                  ),
                  subtitle: Text(empList[index]["designation"]),
                  trailing: Text(
                    empList[index]["salaryType"],
                  ),
                );
              },
            ),*/ /*

          ),
        ],
      ),
    );
  }
  Widget buildItems(empList) => ListView.separated(
      padding: const EdgeInsets.all(0),
      itemCount: empList.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Container(
            height: 50.h,
            width: 50.w,
            color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            child: Center(
              child: Text(
                '${empList[index]["empName"][0]}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          title: customText(
              empList[index]["empName"], Colors.black, 17.sp, FontWeight.w500),
          subtitle: customText(empList[index]["designation"], Colors.black,
              15.sp, FontWeight.w400) */
/*Text(empList[index]["designation"])*/ /*
,
          trailing: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customText(empList[index]["salaryType"], Colors.black, 13.sp,
                  FontWeight.w500),
              customText("Salary", Colors.blue, 15.sp, FontWeight.bold),
              customText(empList[index]["basicPay"], Colors.blue, 15.sp,
                  FontWeight.bold)
            ],
          ),
          onTap: () {
            Get.to(MarkAttendanceEmp(empList, index));
          },
        );
      });
  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate)
      selectedDate = picked;
      */
/*setState(() {
        selectedDate = picked;
      });*/ /*

  }
}
*/

class MarkAttendanceList extends StatefulWidget {
  static const String routeName = "/MarkAttendanceListView";
  const MarkAttendanceList({Key key}) : super(key: key);

  @override
  State<MarkAttendanceList> createState() => _MarkAttendanceListState();
}

class _MarkAttendanceListState extends State<MarkAttendanceList> {
  @override
  void initState() {
    super.initState();
    //getData();
    setState(() {});
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List empList = [];
  final CollectionReference collectionRef =
      FirebaseFirestore.instance.collection("Employees");
  Future getData() async {
    print("get Data Called");
    try {
      //to get data from a single/particular document alone.
      // var temp = await collectionRef.doc("<your document ID here>").get();

      // to get data from all documents sequentially
      await collectionRef.get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          empList.add(result.data());
        }
      });

      return empList;
    } catch (e) {
      debugPrint("Error - $e");
      return e;
    }
  }

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
          child:
              customText("Employee List", Colors.white, 17.sp, FontWeight.w700),
        ),
        actions: const [
          Icon(
            Icons.search,
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
          Expanded(
            child: FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text(
                    "Something went wrong",
                  );
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  empList = snapshot.data as List;
                  return buildItems(empList);
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
            /*ListView.separated(
              padding: const EdgeInsets.all(0),
              itemCount: empList.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Container(
                    height: 50.h,
                    width: 50.w,
                    color: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                    child: const Center(child: Text("Get Image Here")),
                  ),
                  title: Text(
                    empList[index]["empName"],
                  ),
                  subtitle: Text(empList[index]["designation"]),
                  trailing: Text(
                    empList[index]["salaryType"],
                  ),
                );
              },
            ),*/
          ),
        ],
      ),
    );
  }

  Widget buildItems(empList) => ListView.separated(
      padding: const EdgeInsets.all(0),
      itemCount: empList.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Container(
            height: 50.h,
            width: 50.w,
            color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            child: Center(
              child: Text(
                '${empList[index]["empName"][0]}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          title: customText(
              empList[index]["empName"], Colors.black, 17.sp, FontWeight.w500),
          subtitle: customText(empList[index]["designation"], Colors.black,
              15.sp, FontWeight.w400) /*Text(empList[index]["designation"])*/,
          trailing: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customText(empList[index]["salaryType"], Colors.black, 13.sp,
                  FontWeight.w500),
              customText("Salary", Colors.blue, 15.sp, FontWeight.bold),
              customText(empList[index]["basicPay"], Colors.blue, 15.sp,
                  FontWeight.bold)
            ],
          ),
          onTap: () {
            Get.to(MarkAttendanceEmp(empList, index));
          },
        );
      });
  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}
