
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incidents/data/datasource/static.dart';
import 'package:incidents/routes/route.dart';
import 'package:incidents/service/shared_pref.dart';

abstract class OnboarderController extends GetxController {
  next();
  onPageChanged(int index);

}

class OnboarderControllerImp extends OnboarderController {
  int currentPage = 0;
  late PageController pageController;
  StorageService storage = Get.find();

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  next() {
    if (currentPage < onBoardingData.length - 1) {
      currentPage++;
      pageController.animateToPage(currentPage,
          duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      update();
    } else {
    debugPrint("Next Page: $currentPage");
      storage.sharedPreferences.setBool("onBoarding", true);
      Get.offAllNamed(RouteClass.home);
    }
    debugPrint("Next Page: $currentPage");

    
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    debugPrint("Current Page: $currentPage");
    update();
    
  }
}
