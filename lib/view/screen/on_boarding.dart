
import 'package:incidents/controller/onboarder_controller.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:incidents/widgets/onBoarding/custom_button_onboard.dart';
import 'package:incidents/widgets/onBoarding/dotscontroller.dart';
import 'package:incidents/widgets/onBoarding/page_builder.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  

  @override
  Widget build(BuildContext context) {
    Get.put(OnboarderControllerImp());
    return Scaffold(
      body:
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: PageBuilder()),
                Expanded(
                  flex: 0,
                  child: Column(
                    children: [
                    CustomDots(),
                    CustomButtonOnBoarding(),
                     SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        
    );
  }

}