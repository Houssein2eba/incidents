import 'dart:convert';

import 'package:flutter/material.dart'
    show Colors, Icon, Icons, TextEditingController, debugPrint;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:incidents/model/user_model.dart';
import 'package:incidents/routes/route.dart';
import 'package:incidents/service/shared_pref.dart';

class RegisterController extends GetxController {
  late final TextEditingController username,
      email,
      telephone,
      password,
      confirmPassword;
  final StorageService storage = Get.find();
  final RxBool isLoading = false.obs;
  final RxBool isPasswordVisible = true.obs;
  final RxBool isConfirmPasswordVisible = true.obs;
  final String $baseUrl = 'http://192.168.100.13:8000/auth';

  @override
  void onInit() {
    super.onInit();
    username = TextEditingController();
    email = TextEditingController();
    telephone = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
  }

  Future<void> register() async {
    isLoading.value = true;
    try {
      final response = await http.post(
        Uri.parse('http://192.168.100.13:8000/api/auth/register/'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'username': username.text.trim(),
          'email': email.text.trim(),
          'password': password.text.trim(),
          'telephone': telephone.text.trim(),
        }),

      );

      print('Register response===============: ${response.body}');
      print('Register status code===============: ${response.statusCode}');
      if (response.statusCode == 201) {

        Get.snackbar('success', 'registrer avec success', backgroundColor: Colors.white,icon: Icon(Icons.check),shouldIconPulse: true);
        Get.back();
        
      }
      
       else {
        final errorData = json.decode(response.body);
        debugPrint('erreur: ${errorData['message']}');
        Get.snackbar(
          'failure',
          errorData['message'] ?? 'An error occurred',
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      debugPrint('Register error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
