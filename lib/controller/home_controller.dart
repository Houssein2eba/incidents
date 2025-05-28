import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:incidents/service/permissions_service.dart';

class HomeController extends GetxController {
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

late final  PermissionsService permissionsService ;

  @override
  void onInit() {
    super.onInit();
    permissionsService = PermissionsService();
  }

  Future<void> getImage(ImageSource source) async {
    //check permissions
    final camera = await permissionsService.askcameraPermission();
    final storage = await permissionsService.askStoragePermission();

    if (!camera || !storage) {
      Get.snackbar(
        'Error', 'Camera or storage permission not granted',
        backgroundColor: Colors.red,
      );
      return;
    }

    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value = "${(File(selectedImagePath.value).lengthSync()/1024/1024).toStringAsFixed( 2)} MB";
    }else{
      Get.snackbar(
        'Error', 'No image selected',
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM
      );
    }
  }
}
