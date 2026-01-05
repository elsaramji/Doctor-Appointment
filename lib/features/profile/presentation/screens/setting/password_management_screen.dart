


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/themes/colors.dart';
import '../../../../../core/themes/text_styles.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_buttom.dart';
import '../../widgets/custom_text_filed.dart';

class PasswordManagementScreen extends StatefulWidget {
  const PasswordManagementScreen({super.key});

  @override
  State<PasswordManagementScreen> createState() =>
      _PasswordManagementScreenState();
}

class _PasswordManagementScreenState extends State<PasswordManagementScreen> {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomAppBar(title: 'Password management'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Current password
                CustomTextField(
                  icon: 'assets/svg/lock.svg',
                  label: 'Current Password',
                  keyboardType: TextInputType.visiblePassword,
                  hint: 'Enter your current password',
                  controller: currentPasswordController,
                  isObscure: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your current password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),

                // New password
                CustomTextField(
                  keyboardType: TextInputType.visiblePassword,

                  icon: 'assets/svg/lock.svg',
                  label: 'New Password',
                  hint: 'Enter a new password',
                  controller: newPasswordController,
                  isObscure: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a new password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),

                // Confirm new password
                CustomTextField(
                  keyboardType: TextInputType.visiblePassword,

                  icon: 'assets/svg/lock.svg',
                  label: 'Confirm New Password',
                  hint: 'Re-enter new password',
                  controller: confirmPasswordController,
                  isObscure: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    } else if (value != newPasswordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 40.h),

                CustomButton(
                  text: 'Change Password',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Password changed successfully!',
                            style: RegularMontserrat.regularMontserrat14.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                          backgroundColor: AppColors.primary500,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
