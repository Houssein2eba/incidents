

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incidents/controller/home_controller.dart';
import 'package:incidents/core/constant/color.dart';
import 'package:incidents/widgets/home/show_image_picker.dart';

class ImageSelector extends GetView<HomeController> {
  const ImageSelector({super.key});

  @override
  Widget build(BuildContext context) { 
       return SizedBox(
      width: double.infinity,
      height: 180,
      child: Obx(() {
        if (controller.selectedImagePaths.isEmpty) {
          return InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () => showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) => const ShowImagePicker(),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.6),
                  width: 1.5,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_photo_alternate_outlined,
                    size: 48,
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Tap to add photo (0/${HomeController.maxImages})',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.selectedImagePaths.length + (controller.selectedImagePaths.length < HomeController.maxImages ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == controller.selectedImagePaths.length) {
                // Add more button
                return Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () => showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) => const ShowImagePicker(),
                    ),
                    child: Container(
                      width: 180,
                      decoration: BoxDecoration(
                        color: AppColor.surface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.6),
                          width: 1.5,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_photo_alternate_outlined,
                            size: 48,
                            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Add more\n(${controller.selectedImagePaths.length}/${HomeController.maxImages})',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }
              
              return Container(
                width: 180,
                margin: EdgeInsets.only(right: 8),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        File(controller.selectedImagePaths[index]),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: () {
                          controller.selectedImagePaths.removeAt(index);
                          controller.selectedImageSizes.removeAt(index);
                          controller.update();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.errorContainer,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.close,
                            size: 20,
                            color: Theme.of(context).colorScheme.onErrorContainer,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
          }
        }),
      
    );
  }

  }
