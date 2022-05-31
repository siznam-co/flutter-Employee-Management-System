import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:management/Constants/MDAdmin.dart';
import 'package:management/Widgets/customText.dart';

class AdminScrView extends StatefulWidget {
  static const String routeName = "/AdminScrView";
  const AdminScrView({Key key}) : super(key: key);

  @override
  State<AdminScrView> createState() => _AdminScrViewState();
}

class _AdminScrViewState extends State<AdminScrView> {
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
    setState(() {});
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
      setState(() {});
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

  final _formKey = GlobalKey<FormState>();
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue[800],
        title: customText("Admin", Colors.white, 16.sp, FontWeight.w600),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 80.h,
              color: Colors.blue[800],
            ),
            InkWell(
              onTap: () {
                _getFromGallery();
                _upload();
                //setState(() {});
              },
              child: imageFile == null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Container(
                        height: 130.h,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.add_a_photo_outlined,
                            size: 60,
                          ),
                        ),
                      ),
                    )
                  : Container(
                      height: 130.h,
                      decoration: BoxDecoration(
                        color: Colors.white60,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: FileImage(imageFile),
                          fit: BoxFit.contain,
                        ),
                      ),
                      /*child: Center(
                        child: Image.file(
                          imageFile,
                          fit: BoxFit.contain,
                        ),
                      ),*/
                    ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 160.h),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 12.h, left: 12.w, right: 12.w),
                    child: TextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(30),
                      ],
                      keyboardType: TextInputType.name,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        hintText: "Company Name",
                        label: customText("Company Name".toUpperCase(),
                            Colors.grey, 12.sp, FontWeight.w700),
                        prefixIcon: const Icon(
                          Icons.location_city,
                          color: Colors.black,
                          size: 26,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.0),
                        ),
                        border: const OutlineInputBorder(),
                      ),
                      onChanged: (compName) {
                        //companyName = compName;
                        adminData.companyName = compName;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter Company Name";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.only(left: 12.w, right: 12.w),
                    child: TextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(30),
                      ],
                      keyboardType: TextInputType.phone,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        hintText: "Company Registration No",
                        label: customText(
                            "Company Registration No".toUpperCase(),
                            Colors.grey,
                            12.sp,
                            FontWeight.w700),
                        prefixIcon: const Icon(
                          Icons.app_registration,
                          color: Colors.black,
                          size: 26,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.0),
                        ),
                        border: const OutlineInputBorder(),
                      ),
                      onChanged: (companyReg) {
                        //companyRegNo = companyReg;
                        adminData.compReg = companyReg;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter Company Registration Number";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.only(left: 12.w, right: 12.w),
                    child: TextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(30),
                      ],
                      keyboardType: TextInputType.name,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        hintText: "Admin Name",
                        label: customText("Admin Name".toUpperCase(),
                            Colors.grey, 12.sp, FontWeight.w700),
                        prefixIcon: const Icon(
                          Icons.account_circle,
                          color: Colors.black,
                          size: 26,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.0),
                        ),
                        border: const OutlineInputBorder(),
                      ),
                      onChanged: (nameAdmin) {
                        //adminName = nameAdmin;
                        adminData.adminName = nameAdmin;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter Name Here";
                        }
                        return null;
                      },
                    ),
                  ),
                  /*SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.only(left: 12.w, right: 12.w),
                    child: TextFormField(
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        hintText: "Designation",
                        label: customText("Designation".toUpperCase(),
                            Colors.grey, 12.sp, FontWeight.w700),
                        prefixIcon: const Icon(
                          Icons.design_services,
                          color: Colors.black,
                          size: 26,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.0),
                        ),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),*/
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.only(left: 12.w, right: 12.w),
                    child: InkWell(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        showCountryPicker(
                          context: context,
                          showPhoneCode: true,
                          onSelect: (Country country) {
                            //print('Select country: ${country.displayName}');
                            countrys = country;
                            print("this is countrys ${countrys.displayName}");
                            //countryF = countrys.toString();
                            adminData.country = countrys.toString();
                            setState(() {});
                          },
                        );
                      },
                      child: Container(
                        height: 50.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 10.w),
                            const Icon(
                              Icons.flag_sharp,
                              size: 26,
                            ),
                            SizedBox(width: 12.w),
                            Text(countrys == null
                                ? "Select  (Optional)"
                                : countrys.displayName),
                          ],
                        ),
                      ),
                    ),
                  ),
                  /*TextField(
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        hintText: "Country",
                        label: customText("Country".toUpperCase(), Colors.grey,
                            12.sp, FontWeight.w700),
                        prefixIcon: const Icon(
                          Icons.flag_sharp,
                          color: Colors.black,
                          size: 26,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 0.0),
                        ),
                        border: const OutlineInputBorder(),
                      ),
                    ),*/
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.only(left: 12.w, right: 12.w),
                    child: TextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(15),
                      ],
                      keyboardType: TextInputType.phone,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        hintText: "xxxxxxxxxxx",
                        label: customText("Number".toUpperCase(), Colors.grey,
                            12.sp, FontWeight.w700),
                        prefixIcon: const Icon(
                          Icons.mobile_friendly_outlined,
                          color: Colors.black,
                          size: 26,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.0),
                        ),
                        border: const OutlineInputBorder(),
                      ),
                      onChanged: (numb) {
                        //number = numb;
                        adminData.number = numb;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter Mobile Number";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.only(left: 12.w, right: 12.w),
                    child: TextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(30),
                      ],
                      keyboardType: TextInputType.streetAddress,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        hintText: "Address",
                        label: customText("Address".toUpperCase(), Colors.grey,
                            12.sp, FontWeight.w700),
                        prefixIcon: const Icon(
                          Icons.location_on_outlined,
                          color: Colors.black,
                          size: 26,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.0),
                        ),
                        border: const OutlineInputBorder(),
                      ),
                      onChanged: (addre) {
                        //address = addre;
                        adminData.address = addre;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Enter Address";
                        }
                        return null;
                      },
                    ),
                  ),
                  //SizedBox(height: 2.h),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: InkWell(
                      onTap: () {
                        if (_formKey.currentState.validate()) {
                          firestore
                              .collection("Admin Info")
                              .doc("AdminSide")
                              .set(adminData.toMap())
                              .then(
                                (value) =>
                                    ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Data Updated.!'),
                                  ),
                                ),
                              )
                              .then((value) => Get.back())
                              .then((value) => _upload());
                        }
                      },
                      child: Container(
                        height: 50.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.blue[800],
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.verified,
                              color: Colors.white,
                              size: 18,
                            ),
                            SizedBox(width: 5.w),
                            Center(
                              child: customText(
                                "update".toUpperCase(),
                                Colors.white,
                                14.sp,
                                FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
