import 'package:flutter/cupertino.dart';

class AttendanceReport {
  String empName;
  String empId;
  String attendanceStatus;
  String inTime;
  String outTime;

  AttendanceReport({
    @required this.empName,
    @required this.empId,
    @required this.attendanceStatus,
    @required this.inTime,
    @required this.outTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'empName': empName,
      'empId': empId,
      'attendanceStatus': attendanceStatus,
      'inTime': inTime,
      'outTime': outTime,
    };
  }

  factory AttendanceReport.fromMap(Map<String, dynamic> map) {
    return AttendanceReport(
      empName: map['Present'] as String,
      empId: map['Absent'] as String,
      attendanceStatus: map['halfDay'] as String,
      inTime: map['InTime'] as String,
      outTime: map['OutTime'] as String,
    );
  }

  @override
  String toString() {
    return 'AttendanceReport{present: $empName, absent: $empId, halfDay: $attendanceStatus,inTime: $inTime, outTime: $outTime}';
  }
}
