import 'package:incidents/core/services/services.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incidents/routes/route.dart';

class RegitredMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;
  Myservice storage = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (storage.sharedPreferences.getBool("onBoarding") == true) {
      return RouteSettings(name: RouteClass.home);
    }
    return null;
  }
}
