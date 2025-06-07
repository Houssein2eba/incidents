
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:incidents/controller/home_controller.dart';
import 'package:incidents/core/constant/color.dart';
import 'package:incidents/widgets/home/custom_date.dart';
import 'package:incidents/widgets/home/custom_drop.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: const Text("Incident Reporter"),
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
                  children: [
                    Text(
                      'Report Incident',
                      style: textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Date Field
                    Text(
                      'Date',
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColor.textPrimary,
                    ),),
                    const SizedBox(height: 8),
                    CustomDate(),
                    const SizedBox(height: 20),

                    // Incident Type Dropdown
                    CustomDropDown(
                      onChanged: (value)  {
                        // controller.selectedIncidentType.value = value;
                      },
                      label: "Incident Type",
                      items: [
                        "Fire",
                        "Theft",
                        "Accident",
                        "Medical",
                        "Other",
                      ],
                      
                    ),
                    const SizedBox(height: 24),

                    // Image Selector
                    Text(
                      'Add Image',
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColor.textPrimary,
                    ),),
                    const SizedBox(height: 8),
                    ImageSelector(),
                    const SizedBox(height: 24),

                    // Submit Button
                    SpecialButton(
                      text: 'Submit Report',
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