import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:management/Constants/MDEmployee.dart';

class AddEmpScrController extends GetxController {
  DateTime selectedDate = DateTime.now();
  File imageFile;
  File imageFile1;
  String imagesUrl;
  //final ImagePicker _picker = ImagePicker();
  Country countrys;
  String radioButtonItem = 'ONE';
  var addEmpImg = 0.obs;
  String ids;
  Employee empDetail = Employee(
    empId: "",
    joiningDate: "",
    empName: "",
    designation: "",
    mobileNo: "",
    basicPay: "",
    salaryType: "Per Day",
    address: "",
    details: "",
    imageUrl: "",
  ).obs as Employee;
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  PickedFile pickedFile;

  getFromGallery() async {
    pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      imageFile1 = File(pickedFile.path);
    }
    cropImage(pickedFile.path);
    //setState(() {});
  }

  cropImage(filePath) async {
    CroppedFile croppedImage = await ImageCropper().cropImage(
      sourcePath: filePath,
      maxWidth: 1080,
      maxHeight: 1080,
      aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
    );
    if (croppedImage != null) {
      imageFile = croppedImage as File;
    }
    //setState(() {});
  }

  upload() async {
    //final picker = ImagePicker();
    //XFile pickedImage;
    try {
      imageFile = imageFile1;

      try {
        await storage
            .ref("Employee Pictures")
            .child(ids = DateTime.now().millisecondsSinceEpoch.toString())
            .putFile(
              imageFile,
              SettableMetadata(),
            );
        imagesUrl = await storage.ref(ids).getDownloadURL();
        empDetail.imageUrl = imagesUrl;
        print("Id for current Image $ids");
        print("here Is Image Url ${empDetail.imageUrl}");
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
  /*Future<void> _upload() async {
    //final picker = ImagePicker();
    //XFile pickedImage;
    try {
      imageFile = imageFile1;

      try {
        await storage
            .ref("Employee Pictures")
            .child(ids = DateTime.now().millisecondsSinceEpoch.toString())
            .putFile(
              imageFile,
              SettableMetadata(),
            );
        imagesUrl = await storage.ref(ids).getDownloadURL();
        empDetail.imageUrl = imagesUrl;
        print("Id for current Image $ids");
        print("here Is Image Url ${empDetail.imageUrl}");
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
  }*/
}
