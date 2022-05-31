import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:management/Constants/MDEmployee.dart';

class EditDltEmpController extends GetxController {
  DateTime selectedDate = DateTime.now();
  File imageFile;
  File imageFile1;
  final ImagePicker _picker = ImagePicker();
  Country countrys;
  String radioButtonItem = 'ONE';
  int id = 1;
  int addEmpImg = 0;
  final _formKey = GlobalKey<FormState>();
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  PickedFile pickedFile;
  _getFromGallery() async {
    pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      imageFile1 = File(pickedFile.path);
    }
    //_cropImage(pickedFile.path);
    //setState(() {});
  }

  Future<void> _upload() async {
    //final picker = ImagePicker();
    //XFile pickedImage;
    try {
      //pickedFile = pickedFile;
      /* await picker.pickImage(source: ImageSource.gallery, maxWidth: 1920);
      final String fileName = pickedImage.path;*/
      imageFile = imageFile1;

      try {
        await storage.ref("Employee${addEmpImg.toString()}").putFile(
              imageFile,
              SettableMetadata(),
            );

        // Refresh the UI
        //setState(() {});
      } on FirebaseException catch (error) {
        if (kDebugMode) {
          print(error);
        }
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }

  Employee empDetail = Employee(
      empId: "",
      joiningDate: "",
      empName: "",
      designation: "",
      mobileNo: "",
      basicPay: "",
      salaryType: "",
      address: "",
      details: "");
}
