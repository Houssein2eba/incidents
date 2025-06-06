import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incidents/controller/auth/login_controller.dart';
import 'package:incidents/routes/route.dart';
import 'package:incidents/widgets/special_button.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final LoginController authController = Get.put(LoginController());

  LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: colorScheme.primary,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 16),
                    // Logo/Icon

                    // Welcome Text
                    Obx(() {
                      if (authController.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return Text(
                        'Welcome Back',
                        style: textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.primary,
                        ),
                        textAlign: TextAlign.center,
                      );
                    }),
                    const SizedBox(height: 8),
                    Text(
                      'Sign in to continue',
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),

                    // Form
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          // Email/Phone Field
                          _buildTextField(
                            context,
                            controller: authController.identifier,
                            label: 'Email',
                            icon: Icons.person_outline,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email or phone number';
                              }
                              if (!value.contains('@')) {
                                if (RegExp(
                                  r'^[2-4][0-9]{7}$',
                                ).hasMatch(value)) {
                                  return null;
                                } else if (value.length >= 8) {
                                  return null;
                                }
                                return 'Please enter a valid email or phone number';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),

                          // Password Field
                          Obx(
                            () => _buildTextField(
                              context,
                              controller: authController.password,
                              label: 'Password',
                              icon: Icons.lock_outline,
                              obscureText:
                                  authController.isPasswordHidden.value,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  authController.isPasswordHidden.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: colorScheme.onSurface.withValues(alpha: 0.6),
                                ),
                                onPressed: () {
                                  authController.isPasswordHidden.value =
                                      !authController.isPasswordHidden.value;
                                },
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

                          // Forgot Password
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                
                              },
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(color: colorScheme.primary),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Login Button
                          SpecialButton(
                            text: 'Login',
                            onPress: () async {
                              if (formKey.currentState!.validate()) {
                                await authController.login();
                              }
                            },
                            color: colorScheme.primary,
                            textColor: colorScheme.onPrimary,
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),

                    Divider(color: colorScheme.outline.withValues(alpha: 0.6)),
                    const SizedBox(height: 16),

                    // Register Navigation
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: textTheme.bodyMedium,
                        ),
                        TextButton(
                          onPressed:
                              () => Get.toNamed(RouteClass.register),
                          child: Text(
                            'Register',
                            style: TextStyle(color: colorScheme.primary),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context, {
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    bool obscureText = false,
    Widget? suffixIcon,
    String? Function(String?)? validator,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: colorScheme.onSurface.withValues(alpha: 0.6)),
        prefixIcon: Icon(icon, color: colorScheme.onSurface.withValues(alpha: 0.6)),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: colorScheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.error, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
      ),
      validator: validator,
    );
  }
}
