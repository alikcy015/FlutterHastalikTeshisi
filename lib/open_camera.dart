import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_project/vm/class_vm.dart';

class openCamera extends StatefulWidget {
  const openCamera({super.key});

  @override
  State<openCamera> createState() => _openCameraState();
}

class _openCameraState extends State<openCamera> {
  File? imageFile;

  @override
  void initState() {
    _getFromCamera();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => Get.find<ClassVm>().pickedFile.value == null
            ? Container(
                alignment: Alignment.center, child: Text("Bir şey seçin"))
            : Container(
                child: Image.file(
                  Get.find<ClassVm>().pickedFile.value!,
                  fit: BoxFit.cover,
                ),
              )));
  }

  _getFromCamera() async {
    var picked_File = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (picked_File != null) {
      Get.find<ClassVm>().pickedFile.value = File(picked_File.path);
    }
  }
}
