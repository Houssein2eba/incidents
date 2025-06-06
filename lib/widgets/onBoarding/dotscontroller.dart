
import 'package:incidents/controller/onboarder_controller.dart';
import 'package:incidents/data/datasource/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDots extends StatelessWidget {
  const CustomDots({super.key});

  @override
  Widget build(BuildContext context) {
    return   Builder(
      builder: (context) {
        return GetBuilder<OnboarderControllerImp>(builder: (controller) => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ...List.generate(onBoardingData.length, (index)=>AnimatedContainer(
                            duration: Duration(milliseconds: 400),
                            margin: EdgeInsets.all(5),

                            width: controller.currentPage == index ? 50 : 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: index == controller.currentPage ? Colors.blue : Colors.grey,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          )),
                            ],
        )
                          );
      }
    )
                    ;
  }
}