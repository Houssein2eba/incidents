
import 'package:get/get.dart';
import 'package:incidents/controller/auth/login_controller.dart';
import 'package:incidents/controller/home_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // Add dependencies here
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<LoginController>(() => LoginController());
    
    }

}