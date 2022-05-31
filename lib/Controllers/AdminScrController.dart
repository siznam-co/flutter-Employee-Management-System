import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:management/Constants/MDAdmin.dart';

class AdminScr extends GetxController {
  Country countrys;
  File imageFile;
  String imageUrl;
  FirebaseStorage storage = FirebaseStorage.instance;
  _getFromGallery() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
    }
    _cropImage(pickedFile.toString());
    //setState(() {});
  }

  _cropImage(filePath) async {
    CroppedFile croppedImage = await ImageCropper().cropImage(
      sourcePath: filePath,
      maxWidth: 1080,
      maxHeight: 1080,
      aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
    );
    if (croppedImage != null) {
      imageFile = croppedImage as File;
      //setState(() {});
    }
  }

  Future<void> _upload() async {
    try {
      try {
        await storage.ref("Admin Profiles").putFile(
              imageFile,
              SettableMetadata(),
            );
        imageUrl = await storage.ref("Admin Profiles").getDownloadURL();
        print("here Is Image Url $imageUrl");
        adminData.imageAddress = imageUrl;
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

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Admin adminData = Admin(
    address: "",
    adminName: "",
    companyName: "",
    country: "",
    number: "",
    compReg: "",
    imageAddress: "",
  );
}
