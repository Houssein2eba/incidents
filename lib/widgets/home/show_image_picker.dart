
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:incidents/controller/home_controller.dart';

class ShowImagePicker extends GetView<HomeController> {
  const ShowImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(Icons.camera_alt,
                      color: Theme.of(context).colorScheme.primary),
                  title: Text('Take Photo',
                      style: Theme.of(context).textTheme.bodyLarge),
                  onTap: () {
                    controller.getImage(ImageSource.camera);
                    Navigator.pop(context);
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.photo_library,
                      color: Theme.of(context).colorScheme.primary),
                  title: Text('Choose from Gallery',
                      style: Theme.of(context).textTheme.bodyLarge),
                  onTap: () {
                    controller.getImage(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      }
    );
  }
    
  }

  
