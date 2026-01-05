import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:round_7_mobile_cure_team4/core/routes/app_router.dart';
import 'package:round_7_mobile_cure_team4/features/profile/presentation/widgets/custom_appbar.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';
import '../widgets/mobile_wallets.dart';
import '../widgets/payment_tile.dart';


class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  String? selectedPayment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(title: 'Payment Method'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Credit / Debit Card",
              style: MediumMontserrat.mediumMontserrat16.copyWith(
                color: AppColors.secondary500,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 12.h),
            PaymentTile(
              icon: 'assets/svg/brandico_visa.svg',
              title: 'VISA',
              onTap: () {
                context.push(AppRoutes.cardVersion);
              },
            ),
            PaymentTile(
              icon: 'assets/svg/logos_mastercard.svg',
              title: 'MasterCard',
              onTap: () {
                context.push(AppRoutes.cardVersion);
              },
            ),
            SizedBox(height: 20.h),
            Text(
              "Mobile Wallets",
              style: MediumMontserrat.mediumMontserrat16.copyWith(
                color: AppColors.secondary500,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 12.h),
            MobileWallets(
              icon: 'assets/svg/logos_apple-pay.svg',
              title: 'Apple Pay',
              isSelected: selectedPayment == 'Apple Pay',
              onTap: () {
                setState(() {
                  selectedPayment = 'Apple Pay';
                });
              },
            ),
            MobileWallets(
              icon: 'assets/svg/outline-paypal.svg',
              title: 'PayPal',
              isSelected: selectedPayment == 'PayPal',
              onTap: () {
                setState(() {
                  selectedPayment = 'PayPal';
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
