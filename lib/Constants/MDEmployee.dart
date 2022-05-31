import 'package:flutter/cupertino.dart';

class Employee {
  String empId;
  String joiningDate;
  String empName;
  String designation;
  String mobileNo;
  String basicPay;
  String salaryType;
  String address;
  String details;
  String imageUrl;

  Employee({
    @required this.empId,
    @required this.joiningDate,
    @required this.empName,
    @required this.designation,
    @required this.mobileNo,
    @required this.basicPay,
    @required this.salaryType,
    @required this.address,
    @required this.details,
    @required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'empId': empId,
      'joiningDate': joiningDate,
      'empName': empName,
      'designation': designation,
      'mobileNo': mobileNo,
      'basicPay': basicPay,
      'salaryType': salaryType,
      'address': address,
      'details': details,
      'imageUrl': imageUrl,
    };
  }

  factory Employee.fromMap(Map<String, dynamic> map) {
    return Employee(
      empId: map['empId'] as String,
      joiningDate: map['joiningDate'] as String,
      empName: map['empName'] as String,
      designation: map['designation'] as String,
      mobileNo: map['mobileNo'] as String,
      basicPay: map['basicPay'] as String,
      salaryType: map['salaryType'] as String,
      address: map['address'] as String,
      details: map['details'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

  @override
  String toString() {
    return 'Employee{empId: $empId, joiningDate: $joiningDate, empName: $empName, designation: $designation, mobileNo: $mobileNo, basicPay: $basicPay, salaryType: $salaryType, address: $address, details: $details, imageUrl: $imageUrl}';
  }
}
