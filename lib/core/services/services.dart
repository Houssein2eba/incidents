
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Myservice extends GetxService{

  late SharedPreferences sharedPreferences;
  Future<Myservice> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  
}
initialServices() async {
    await Get.putAsync(() => Myservice().init());
  }

  