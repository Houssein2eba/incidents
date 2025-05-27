import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incidents/widgets/special_button.dart';
import 'package:incidents/controller/auth/login_controller.dart';


class RegisterForm extends StatelessWidget {



  RegisterForm({super.key});
final LoginController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child:ElevatedButton(onPressed: ()=>Get.back(), child: Text('Back'))),
    );
  }
}
