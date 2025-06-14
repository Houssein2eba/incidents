
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:incidents/controller/home_controller.dart';
import 'package:incidents/widgets/home/custom_date.dart';
import 'package:incidents/widgets/home/custom_drop.dart';
import 'package:incidents/widgets/home/custom_label.dart';
import 'package:incidents/widgets/home/image_selector.dart';
import 'package:incidents/widgets/special_button.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
  final HomeController controller = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(      appBar: AppBar(
        title: Text("incident_reporter".tr),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: colorScheme.onPrimary),
            onPressed: ()  {
              // authController.logout()
              },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [                    Text(
                      'report_incident'.tr,
                      style: textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Date Field
                    CustomLabel(text: "date".tr),
                    const SizedBox(height: 8),
                    CustomDate(),
                    const SizedBox(height: 20),
                    const SizedBox(height: 6),
                    CustomLabel(text: "category".tr),
                    const SizedBox(height: 8),
                    // Incident Type Dropdown
                    CustomDropDown(
                      onChanged: (value)  {
                        // controller.selectedIncidentType.value = value;
                      },
                      label: "Incident Type",                      items: [
                        "fire".tr,
                        "theft".tr,
                        "accident".tr,
                        "medical".tr,
                        "other".tr,
                      ],
                      
                    ),
                    const SizedBox(height: 24),
                    // Image Selector
                    CustomLabel(text: "select_image".tr),
                    const SizedBox(height: 8),
                    ImageSelector(),
                    const SizedBox(height: 10),                    CustomLabel(text: "description".tr),
                    const SizedBox(height: 8),
                    TextField(
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: 'enter_description'.tr,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: colorScheme.outline.withOpacity(0.6),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: colorScheme.outline.withOpacity(0.6),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: colorScheme.primary,
                          ),
                        ),
                        contentPadding: const EdgeInsets.all(16),
                      ),
                      onChanged: (value) {
                        controller.descriptionText.value = value;
                      },
                    ),
                    const SizedBox(height: 24),
                    // Submit Button
                    SpecialButton(
                      text: 'submit_report'.tr,
                      onPress: () {},
                      color: colorScheme.primary,
                      textColor: colorScheme.onPrimary,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  
  
}