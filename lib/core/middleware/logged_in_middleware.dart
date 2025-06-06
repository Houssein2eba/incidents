

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:incidents/routes/route.dart';
import 'package:incidents/service/shared_pref.dart';

class LoggedInMiddleware extends GetMiddleware{
  
  @override
  int? get priority => 1;
  StorageService storage = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (storage.sharedPreferences.getBool("onBoarding") == true) {
      return RouteSettings(name: RouteClass.home);
    }
    return null;
  }
}