import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:management/Views/addEmpScr/addEmpScr.dart';
import 'package:management/Views/edit_dlt_emp/edit_dlt_emp.dart';
import 'package:management/Widgets/customText.dart';

class EmployeeList extends StatefulWidget {
  static const String routeName = "/EmployeeListView";
  const EmployeeList({Key key}) : super(key: key);

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  @override
  void initState() {
    super.initState();
    /*getData();
    setState(() {});*/
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
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddEmployeeView());
        },
        backgroundColor: Colors.blue[800],
        child: const Icon(Icons.add),
      ),
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
          )
        ],
      ),
      body: Column(
        children: [
          // ElevatedButton(onPressed: (){print(empList["imageUrl"]);}, child: Text("Print URL")),
          SizedBox(height: 10.h),
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
          )
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
              decoration: BoxDecoration(
                color:
                    Colors.primaries[Random().nextInt(Colors.primaries.length)],
                shape: BoxShape.circle,
              ),
              child: Center(
                  child: Text(
                '${empList[index]["empName"][0]}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                ),
              )),
              //  child: const Center(child: Text("Image Here")),
            ),
            title: customText(empList[index]["empName"], Colors.black, 17.sp,
                FontWeight.w500),
            /*Text(
            empList[index]["empName"],
          ),*/
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
              Get.to(EditDeleteEmployee(index, empList));
            },
          );
        },
      );
}
