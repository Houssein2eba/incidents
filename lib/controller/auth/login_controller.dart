import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:incidents/routes/route.dart';
import 'package:incidents/service/biometric_auth.dart';
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
    _tryAutoBiometricAuth();
    super.onInit();
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  Future<void> login() async {
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

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

         storageService.sharedPreferences.setString('token',(data['token']));
        
        Get.offNamed(RouteClass.home);
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
      await storageService.sharedPreferences.remove('token');
      await http
          .post(
            Uri.parse('http://192.168.100.13:8000/api/auth/logout'),
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            },
          )
          .timeout(const Duration(seconds: 30));

      Get.offAllNamed(RouteClass.login);
    } catch (e) {
      debugPrint('Logout error: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _tryAutoBiometricAuth() async {
    final bool useBiometrics =
        storageService.sharedPreferences.getBool('useBiometrics') ?? false;
    if (useBiometrics) {
      final biometricAuth = BiometricAuthService();
      final success = await biometricAuth.authenticate();
      if (success) {
        final String? token = storageService.sharedPreferences.getString('token');
        if (token != null) {
          Get.offAllNamed(RouteClass.home);
        } else {
          Fluttertoast.showToast(
            msg: 'Biometric authentication failed',
            backgroundColor: Colors.white,
            textColor: Colors.red,
            gravity: ToastGravity.TOP,
          );
        }
      }
    }
  }
}
