
import 'package:get/get.dart';
import 'package:incidents/controller/auth/login_controller.dart';
import 'package:incidents/controller/auth/register_controller.dart';
import 'package:incidents/controller/home_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // Add dependencies here
    Get.lazyPut<HomeController>(() => HomeController(),fenix: true);
    Get.lazyPut<LoginController>(() => LoginController(),fenix: true,);
    Get.lazyPut<RegisterController>(() => RegisterController(),fenix: true);
    
    }

}