import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:incidents/model/user_model.dart';
import 'package:incidents/routes/route.dart';
import 'package:incidents/service/shared_pref.dart';

class LoginController extends GetxController {
  late final TextEditingController identifier;
  late final TextEditingController password;
  final RxBool isPasswordHidden = true.obs;
  final RxBool isLoading = false.obs;

  final StorageService storageService = Get.find();
  

  @override
  void onInit() {
    identifier = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  Future<void> login() async {
    debugPrint('Login identifier===============: ${identifier.text.trim()}');
    try {
      isLoading.value = true;

      final response = await http.post(
        Uri.parse('http://192.168.100.13:8000/api/auth/login/'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'username': identifier.text.trim(),
          'password': password.text.trim(),
        }),
      );
      debugPrint('Login status code===============: ${response.statusCode}');
      debugPrint('Login response===============: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        debugPrint(
          'Login user email===============: ${data['user'].runtimeType}',
        );
        await storageService.saveToken(data['token']);
        User user = User.fromJson(data['user']);
        debugPrint("====user ${user}");
        await storageService.saveUser(user);
        Get.offNamed(RouteClass.getHomeRoute());
      } else {
        final errorData = json.decode(response.body);
        debugPrint('Login error: ${errorData['message']}');
        Get.snackbar(
          'Login Failed',
          errorData['message'] ?? 'Invalid credentials',
          backgroundColor: Colors.red.shade100,
          colorText: Colors.red.shade900,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to connect to server. Please try again.',
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red.shade900,
      );
      debugPrint('Login error: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    try {
      isLoading.value = true;
      await storageService.clearToken();
      await http
          .post(
            Uri.parse('http://192.168.100.13:8000/api/auth/logout'),
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            },
          )
          .timeout(const Duration(seconds: 30));

      Get.offAllNamed(RouteClass.getLoginRoute());
    } catch (e) {
      debugPrint('Logout error: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }
}
