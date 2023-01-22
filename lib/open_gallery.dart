import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_project/vm/class_vm.dart';

class openGallery extends StatefulWidget {
  const openGallery({super.key});

  @override
  State<openGallery> createState() => _openGalleryState();
}

class _openGalleryState extends State<openGallery> {
  File? imageFile;

  @override
  void initState() {
    _getFromGallery();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Image Picker"),
        ),
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

  _getFromGallery() async {
    var pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      Get.find<ClassVm>().pickedFile.value = File(pickedFile.path);
    }
  }
}
