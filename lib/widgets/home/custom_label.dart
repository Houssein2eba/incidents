
import 'package:flutter/material.dart';
import 'package:incidents/core/constant/color.dart';

class CustomLabel extends StatelessWidget {
  final String text;
  
  const CustomLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return                     Text(
                      text,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColor.textPrimary,
                    ),);
  }
}