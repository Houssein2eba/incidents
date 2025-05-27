import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incidents/controller/auth/login_controller.dart';
import 'package:incidents/widgets/special_button.dart';

class LoginForm extends StatelessWidget {
final GlobalKey<FormState> formKey = GlobalKey<FormState>();

   LoginForm({super.key});
  final LoginController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 80),
                // Logo/Icon with better styling
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.person, size: 80, color: Colors.blue),
                ),
                const SizedBox(height: 40),
                // Welcome text
                Obx(() {
                  // Show loading indicator if authentication is in progress
                  if (authController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  // Show welcome message when not loading
                  return Text(
                    'Welcome Back',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                    textAlign: TextAlign.center,
                  );
                }),
                const SizedBox(height: 8),
                Text(
                  'Sign in to continue',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                // Form
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: authController.identifier,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email or Phone',
                          labelStyle: TextStyle(color: Colors.grey[600]),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.grey[600],
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 20,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email or phone number';
                          }
                          if (!value.contains('@')) {
                            if (RegExp(r'^[2-4][0-9]{7}$').hasMatch(value)) {
                              return null;
                            }
                            return 'Please enter a valid email or phone number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      Obx(
                        () => TextFormField(
                          controller: authController.password,
                          obscureText: authController.isPasswordHidden.value,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.grey[600]),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.grey[600],
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 20,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.blue,
                                width: 2,
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon: Obx(
                                () =>
                                    authController.isPasswordHidden.value
                                        ? const Icon(Icons.visibility_off)
                                        : const Icon(Icons.visibility),
                              ),
                              color: Colors.grey[600],
                              onPressed: () {
                                authController.isPasswordHidden.value =
                                    !authController.isPasswordHidden.value;
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }

                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Forgot password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // Forgot password action
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.blue[600]),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Login button
                      SpecialButton(
                        text: 'login',
                        onPress: () async {
                          if (formKey.currentState!.validate()) {
                            await authController.login();
                          }
                        },
                        color: Colors.blue,
                        textColor: Colors.white,
                      ),
                      const SizedBox(height: 24),
                      // Divider with "or"
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
