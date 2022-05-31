import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MarkAttendanceEmpController extends GetxController {
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
}
