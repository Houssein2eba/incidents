
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:incidents/controller/home_controller.dart';
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
                        color: colorScheme.onSurface.withValues(alpha: 0.6),
                    ),),
                    const SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        color: colorScheme.surface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: colorScheme.outline.withValues(alpha: 0.6),
                        ),
                      ),
                      child: Text(
                        'TUE MAY 27 2025',
                        style: textTheme.bodyLarge?.copyWith(
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Incident Type Dropdown
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Incident Type',
                        labelStyle: TextStyle(
                            color: colorScheme.onSurface.withValues(alpha: 0.6)),
                        filled: true,
                        fillColor: colorScheme.surface,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: colorScheme.primary, width: 2),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                      ),
                      items: [
                        DropdownMenuItem(
                          value: 'Option 1',
                          child: Text('Option 1',
                              style: textTheme.bodyMedium),
                        ),
                        DropdownMenuItem(
                          value: 'Option 2',
                          child: Text('Option 2',
                              style: textTheme.bodyMedium),
                        ),
                      ],
                      onChanged: (value) {},
                    ),
                    const SizedBox(height: 24),

                    // Image Selector
                    Text(
                      'Add Image',
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface.withValues(alpha: 0.6),
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