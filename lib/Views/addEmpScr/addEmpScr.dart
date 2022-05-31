import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:management/Constants/MDEmployee.dart';
import 'package:management/Widgets/customText.dart';

class AddEmployeeView extends StatefulWidget {
  static const String routeName = "/AddEmployeeView";

  @override
  State<AddEmployeeView> createState() => _AddEmployeeViewState();
}

class _AddEmployeeViewState extends State<AddEmployeeView> {
  DateTime selectedDate = DateTime.now();
  File imageFile;
  File imageFile1;
  String imagesUrl;
  //final ImagePicker _picker = ImagePicker();
  Country countrys;
  String radioButtonItem = 'ONE';
  int id = 1;
  int addEmpImg = 0;
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
  );
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
    _cropImage(pickedFile.path);
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
    }
    setState(() {});
  }

  Future<void> _upload() async {
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
        setState(() {});
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 13.0.w),
          child: customText(
              "Summary Report", Colors.white, 17.sp, FontWeight.w700),
        ),
        /*actions: [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: InkWell(
              onTap: () {
                print(empDetail.imageUrl);
              },
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ],*/
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
                //_upload();
                addEmpImg += 1;
                //setState(() {});
              },
              child: imageFile1 == null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Container(
                        height: 100.h,
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
                          image: FileImage(imageFile1),
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
                  /*ElevatedButton(
                      onPressed: () {
                        print(widget.index);
                        print(widget.empList[widget.index]["empName"]);
                      },
                      child: Text("print")),*/
                  SizedBox(height: 160.h),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 12.h, left: 12.w, right: 12.w),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        hintText: "NIC/ Employee ID",
                        label: customText("NIC/ Employee ID".toUpperCase(),
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
                      onChanged: (employeeId) {
                        empDetail.empId = employeeId;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Enter Employee Id";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.only(left: 12.w, right: 12.w),
                    child: InkWell(
                      onTap: () {
                        _selectDate(context);
                        empDetail.joiningDate =
                            selectedDate.toLocal().toString();
                      },
                      child: Container(
                        height: 50.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: ListTile(
                          leading: const Icon(
                            Icons.calendar_today_outlined,
                            color: Colors.black,
                          ),
                          title: customText("Joining Date", Colors.black, 12.sp,
                              FontWeight.w500),
                          trailing: Text(
                            "${selectedDate.toLocal()}".split(' ')[0],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.only(left: 12.w, right: 12.w),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        hintText: "Employee Name",
                        label: customText("Employer Name".toUpperCase(),
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
                      onChanged: (name) {
                        empDetail.empName = name;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Enter Employee Name";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.only(left: 12.w, right: 12.w),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        hintText: "Designation",
                        label: customText(
                            "Designation", Colors.grey, 12.sp, FontWeight.w700),
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
                      onChanged: (designations) {
                        empDetail.designation = designations;
                      },
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
                      keyboardType: TextInputType.phone,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        hintText: "Mobile Number",
                        label: customText(
                            "Mobile No", Colors.grey, 12.sp, FontWeight.w700),
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
                      onChanged: (num) {
                        empDetail.mobileNo = num;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Enter Mobile Number";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.only(left: 12.w, right: 12.w),
                    child: TextFormField(
                      keyboardType: const TextInputType.numberWithOptions(
                        signed: true,
                        decimal: true,
                      ),
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        hintText: "Basic Pay",
                        label: customText(
                            "Basic Pay", Colors.grey, 12.sp, FontWeight.w700),
                        prefixIcon: const Icon(
                          Icons.currency_pound,
                          color: Colors.black,
                          size: 26,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.0),
                        ),
                        border: const OutlineInputBorder(),
                      ),
                      onChanged: (pay) {
                        empDetail.basicPay = pay;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Enter Basic Payment";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Transform.scale(
                          scale: 0.9,
                          child: Radio(
                            value: 1,
                            groupValue: id,
                            onChanged: (val) {
                              setState(() {
                                radioButtonItem = 'ONE';
                                id = 1;
                                empDetail.salaryType = "Per Day";
                              });
                            },
                          ),
                        ),
                        Text(
                          'Per Day',
                          style: TextStyle(fontSize: 13.sp),
                        ),
                        Transform.scale(
                          scale: 0.9,
                          child: Radio(
                            value: 2,
                            groupValue: id,
                            onChanged: (val) {
                              setState(() {
                                radioButtonItem = 'TWO';
                                id = 2;
                                empDetail.salaryType = 'Per Month';
                              });
                            },
                          ),
                        ),
                        Text(
                          'Monthly',
                          style: TextStyle(fontSize: 13.sp),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12.w, right: 12.w),
                    child: TextFormField(
                      keyboardType: TextInputType.streetAddress,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        hintText: "Address",
                        label: customText(
                            "Address", Colors.grey, 12.sp, FontWeight.w700),
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
                      onChanged: (addr) {
                        empDetail.address = addr;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Enter Address";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.only(left: 12.w, right: 12.w),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        hintText: "Details",
                        label: customText("Details Optional", Colors.grey,
                            12.sp, FontWeight.w700),
                        prefixIcon: const Icon(
                          Icons.sticky_note_2,
                          color: Colors.black,
                          size: 26,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.0),
                        ),
                        border: const OutlineInputBorder(),
                      ),
                      onChanged: (detail) {
                        empDetail.details = detail;
                      },
                      /*validator: (value)
                      {
                        if(value.isEmpty)
                        {
                          return "Enter Details";
                        }
                        else {
                          return null;
                        }
                      },*/
                    ),
                  ),
                  //SizedBox(height: 2.h),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: InkWell(
                      onTap: () async {
                        //_upload();
                        if (_formKey.currentState.validate()) {
                          await firestore
                              .collection("Employees")
                              .doc(DateTime.now()
                                  .millisecondsSinceEpoch
                                  .toString())
                              .set({
                                "address": empDetail.address,
                                "basicPay": empDetail.basicPay,
                                "designation": empDetail.designation,
                                "details": empDetail.details,
                                "empId": empDetail.empId,
                                "empName": empDetail.empName,
                                "imageUrl": empDetail.imageUrl,
                                "joiningDate": empDetail.joiningDate,
                                "mobileNo": empDetail.mobileNo,
                                "salaryType": empDetail.salaryType,
                              })
                              .then(
                                (value) =>
                                    ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Employee Added.!'),
                                  ),
                                ),
                              )
                              .then((value) => Get.back())
                              .then((value) => _upload());
                        }
                        print("here is down${empDetail.imageUrl.toString()}");
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
                              size: 22,
                            ),
                            SizedBox(width: 5.w),
                            Center(
                              child: customText(
                                "Add".toUpperCase(),
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
            ),
          ],
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
