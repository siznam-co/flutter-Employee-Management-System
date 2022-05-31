import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:management/Constants/MDattendance.dart';

class MarkAttendanceScreenController extends GetxController {
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
}
