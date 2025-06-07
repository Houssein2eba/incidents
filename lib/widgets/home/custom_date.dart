import 'package:flutter/material.dart';
import 'package:incidents/core/constant/color.dart';
import 'package:intl/intl.dart';


class CustomDate extends StatelessWidget {
  const CustomDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        color:AppColor.successColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColor.surface,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          DateFormat('yyyy-MM-dd').format(DateTime.now()),
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppColor.surface,
                          ),
                        ),
                      ),
                    )
                  ;
  }
}