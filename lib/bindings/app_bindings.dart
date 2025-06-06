import 'package:get/get.dart';
import 'package:incidents/core/class/crud.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // Add dependencies here
    Get.put(Crud());
  }
}
