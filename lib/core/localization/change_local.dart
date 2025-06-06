import 'package:incidents/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Localcontroller extends GetxController {
  Locale? lang;

  Myservice storage = Get.find();

  @override
  void onInit() {

    String? currentLang = storage.sharedPreferences.getString("lang");

    if (currentLang == "ar") {
      lang = const Locale('ar');
    } else if (currentLang == "fr") {
      lang = const Locale('fr');
    } else {
      lang = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();

  }

  changeLang(String langCode) {
    Locale? locale = Locale(langCode);
    storage.sharedPreferences.setString("lang", langCode);
    Get.updateLocale(locale);
  }
}
