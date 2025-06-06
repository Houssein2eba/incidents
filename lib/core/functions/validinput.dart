import 'package:get/get.dart';

String? validInput(String val, int min, int max, String? type) {
  String value = val.trim();

  if (value.isEmpty) {
    return "27".tr;
  }

  if (value.length < min) {
    return "${"28".tr} $min ${"31".tr}";
  }
  if (value.length > max) {
    return "${"29".tr} $max ${"31".tr}";
  }

  if (type == "username") {
    if (!GetUtils.isUsername(value)) {
      return "30".tr;
    }
  } else if (type == "email") {
    if (!GetUtils.isEmail(value)) {
      return "32".tr;
    }
  } else if (type == "phone") {
    if (!GetUtils.isPhoneNumber(value)) {
      return "33".tr;
    }
    if (!RegExp(r'^[2-4][0-9]{7}$').hasMatch(value)) {
      return "34".tr;
    }
  } else if (type == "password") {
    if (!GetUtils.isLengthGreaterThan(value, min)) {
      return "${"15".tr} ${"35".tr} $min ${"31".tr}";
    }
    if (!GetUtils.isLengthLessThan(value, max)) {
      return "${"15".tr} ${"36".tr} $max ${"31".tr}";
    }
  } else if (type == "emailOrPhone") {
    if (!GetUtils.isEmail(value) && !GetUtils.isPhoneNumber(value)) {
      return "38".tr;
    }
    if (GetUtils.isPhoneNumber(value) && !RegExp(r'^[2-4][0-9]{7}$').hasMatch(value)) {
      return "34".tr;
    }
  } else {
    return "37".tr;
  }

  return null;
}
