import 'package:flutter/material.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';

import '../widgets/custom_appbar.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(title: 'Privacy Policy'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Last Updated:',
                  style: RegularGeorgia.regularGeorgia20,
                ),
                const SizedBox(width: 4),
                Text(
                  '19/11/2024',
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontSize: 14,
                    color: AppColors.neutral600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            Text(
              'Welcome to Cure. Your privacy is important to us. This Privacy Policy explains how we collect, use, and protect your personal information when you use our doctor appointment booking app.',
              style:MediumMontserrat.mediumMontserrat16.copyWith(
                color: AppColors.neutral900,
              ),
            ),
            const SizedBox(height: 24),

            Text(
              'Terms & Conditions',
              style:RegularGeorgia.regularGeorgia24.copyWith(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),


            Text(
              'By registering, accessing, or using this app, you confirm that you are at least 18 years old (or have parental/guardian consent if younger) and agree to be bound by these Terms and our Privacy Policy.',
              style:MediumMontserrat.mediumMontserrat16.copyWith(
                color: AppColors.neutral900,
              ),

            ),
            const SizedBox(height: 14),

            // --- You agree to: ---
            Text(
              'You agree to:',
              style: AppTextStyles.bodyLarge.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 6),
            _bullet('Use the app only for lawful purposes.'),
            _bullet('Provide accurate and complete information during registration and booking.'),
            _bullet('Not impersonate others or create fake accounts.'),
            const SizedBox(height: 16),

            // --- You may not: ---
            Text(
              'You may not:',
              style: AppTextStyles.bodyLarge.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 6),
            _bullet('Disrupt or interfere with the app’s functionality.'),
            _bullet('Try to access data or systems not meant for you.'),
            _bullet('Use the app to harass or abuse doctors or staff.'),
            const SizedBox(height: 16),

            // --- Final Note ---
            Text(
              'Your data is handled in accordance with our Privacy Policy. You are responsible for keeping your login credentials secure.',
              style: AppTextStyles.bodyLarge.copyWith(
                fontSize: 15,
                height: 1.6,
                color: AppColors.neutral900,
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _bullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(fontSize: 15, color: AppColors.black),
          ),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.bodyLarge.copyWith(
                fontSize: 15,
                height: 1.5,
                color: AppColors.neutral900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

