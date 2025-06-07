import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:incidents/service/permissions_service.dart';

class HomeController extends GetxController {
  var selectedImagePaths = <String>[].obs;
  var selectedImageSizes = <String>[].obs;
  var descriptionText = ''.obs;

  late final PermissionsService permissionsService;
  static const int maxImages = 3;

  @override
  void onInit() {
    super.onInit();
    permissionsService = PermissionsService();
  }
  Future<void> getImage(ImageSource source) async {
    if (selectedImagePaths.length >= maxImages) {
      Get.snackbar(
        'Error', 'Maximum $maxImages images allowed',
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM
      );
      return;
    }

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
      selectedImagePaths.add(pickedFile.path);
      selectedImageSizes.add("${(File(pickedFile.path).lengthSync()/1024/1024).toStringAsFixed(2)} MB");
      update();
    } else {
      Get.snackbar(
        'Error', 'No image selected',
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM
      );
    }
  }
}
