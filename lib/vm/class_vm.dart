import 'dart:io';

import 'package:get/get.dart';

class ClassVm extends GetxController {
  Rx<File?> pickedFile = File("").obs;

  // ignore: non_constant_identifier_names
  Rx<File?> picked_File = File("").obs;
}
