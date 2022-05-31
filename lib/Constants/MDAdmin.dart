import 'package:flutter/cupertino.dart';

class Admin {
  String address;
  String adminName;
  String companyName;
  String country;
  String number;
  String compReg;
  String imageAddress;
  //String gender = "";
  //String city = "";
  //String email = "";
  //int age = 8;
  //double height = 0.0;
  //double weight = 0.0;

  //String image = "";
  //double rate = 0.0;

  Admin({
    @required this.address,
    @required this.adminName,
    @required this.companyName,
    @required this.country,
    @required this.number,
    @required this.compReg,
    @required this.imageAddress,
  });

  Map<String, dynamic> toMap() {
    return {
      'Address': address,
      'adminName': adminName,
      'companyName': companyName,
      'country': country,
      'number': number,
      'companyRegNo': compReg,
      'imageAddress': imageAddress,
    };
  }

  factory Admin.fromMap(Map<String, dynamic> map) {
    return Admin(
      address: map['Address'] as String,
      adminName: map['adminName'] as String,
      companyName: map['companyName'] as String,
      country: map['country'] as String,
      number: map['number'] as String,
      compReg: map['companyRegNo'] as String,
      imageAddress: map['imageAddress'] as String,
    );
  }

  @override
  String toString() {
    return 'Admin{Address: $address, adminName: $adminName, companyName: $companyName, country: $country, number: $number, companyRegNo:$compReg, imageAddress:$imageAddress}';
  }
}
