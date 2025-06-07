import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incidents/controller/onboarder_controller.dart';
import 'package:incidents/core/constant/color.dart';
import 'package:incidents/data/datasource/static.dart';

class CustomButtonOnBoarding extends GetView<OnboarderControllerImp> {
  const CustomButtonOnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 40,
      child: MaterialButton(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
          textColor: Colors.white,
          onPressed: () {
            controller.next();
          },
          color: AppColor.primary,
          child: GetBuilder< OnboarderControllerImp>(
            builder: (context) {
              return context.currentPage == onBoardingData.length - 1 ? Text("start".tr) : Text("next".tr);
            }
          )),
    );
  }
}