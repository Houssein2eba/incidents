import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incidents/controller/auth/register_controller.dart';
import 'package:incidents/widgets/special_button.dart';

class RegisterForm extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final RegisterController controller = Get.put(RegisterController());

  RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: colorScheme.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 450),
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Create Account',
                          textAlign: TextAlign.center,
                          style: textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 24),

                        _buildTextField(
                          context,
                          controller: controller.username,
                          label: 'Username',
                          icon: Icons.person_outline,
                          validator: (value) =>
                              (value == null || value.isEmpty) ? 'Please enter your username' : null,
                        ),
                        const SizedBox(height: 16),

                        _buildTextField(
                          context,
                          controller: controller.email,
                          label: 'Email',
                          icon: Icons.email_outlined,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) return 'Please enter your email';
                            if (!value.contains('@')) return 'Please enter a valid email';
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        _buildTextField(
                          context,
                          controller: controller.telephone,
                          label: 'Phone Number',
                          icon: Icons.phone_outlined,
                          keyboardType: TextInputType.phone,
                        ),
                        const SizedBox(height: 16),

                        Obx(() => _buildTextField(
                              context,
                              controller: controller.password,
                              label: 'Password',
                              icon: Icons.lock_outline,
                              obscureText: controller.isPasswordVisible.value,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  controller.isPasswordVisible.value
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: colorScheme.onSurface.withValues(alpha: 0.6),
                                ),
                                onPressed: () {
                                  controller.isPasswordVisible.value =
                                      !controller.isPasswordVisible.value;
                                },
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) return 'Please enter your password';
                                if (value.length < 6) return 'Password must be at least 6 characters';
                                return null;
                              },
                            )),
                        const SizedBox(height: 16),

                        Obx(() => _buildTextField(
                              context,
                              controller: controller.confirmPassword,
                              label: 'Confirm Password',
                              icon: Icons.lock_outline,
                              obscureText: controller.isConfirmPasswordVisible.value,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  controller.isConfirmPasswordVisible.value
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: colorScheme.onSurface.withValues(alpha: 0.6),
                                ),
                                onPressed: () {
                                  controller.isConfirmPasswordVisible.value =
                                      !controller.isConfirmPasswordVisible.value;
                                },
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) return 'Please confirm your password';
                                if (value != controller.password.text) return 'Passwords do not match';
                                return null;
                              },
                            )),
                        const SizedBox(height: 24),

                        Obx(() => controller.isLoading.value
                            ? Center(child: CircularProgressIndicator(color: colorScheme.primary))
                            : SpecialButton(
                                text: 'Register',
                                onPress: () async {
                                  if (formKey.currentState!.validate()) {
                                    await controller.register();
                                  }
                                },
                                color: colorScheme.primary,
                                textColor: colorScheme.onPrimary,
                              )),
                        const SizedBox(height: 16),

                        TextButton(
                          
                          onPressed: () => Get.back(),
                          child: Text(
                            'Already have an account? Sign In',
                            style: textTheme.bodySmall?.copyWith(color: colorScheme.primary),
                          ),
                          
                        ),
                      ],
                    ),
                  ),
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
        prefixIcon: Icon(icon, color: colorScheme.onSurface.withValues(alpha: 0.6)),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: colorScheme.surface,
        labelStyle: TextStyle(color: colorScheme.onSurface.withValues(alpha: 0.6)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
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
          borderSide: BorderSide(color: colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.error, width: 2),
        ),
      ),
      validator: validator,
    );
  }
}
