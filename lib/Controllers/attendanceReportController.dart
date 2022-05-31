import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendanceReport extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List dates = [];
  final CollectionReference collectionRef =
      FirebaseFirestore.instance.collection("AttendanceReports");

  DateTime selectedDate = DateTime.now();
  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      /*setState(() {
        selectedDate = picked;
      });*/
    }
  }

  Future getData() async {
    print("get Data Called");
    try {
      //to get data from a single/particular document alone.
      // var temp = await collectionRef.doc("<your document ID here>").get();

      // to get data from all documents sequentially
      await collectionRef
          .doc((selectedDate.toString()).substring(0, 10))
          .collection("ALl Employees")
          .get()
          .then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          dates.add(result.data());
        }
      });

      return dates;
    } catch (e) {
      debugPrint("Error - $e");
      return e;
    }
  }
}
