import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';
import 'package:round_7_mobile_cure_team4/features/profile/presentation/widgets/custom_buttom.dart';

class BookingBottomBar extends StatelessWidget {
  final double price;
  final String titel;
  final VoidCallback onContinue;

  const BookingBottomBar({
    super.key,
    required this.price,
    required this.titel,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Price ',
                          style: MediumMontserrat.mediumMontserrat24,
                        ),
                        TextSpan(
                          text: '/hour',
                          style: RegularMontserrat.regularMontserrat16.copyWith(
                            color: AppColors.secondary200,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '$price\$',
                    style: MediumMontserrat.mediumMontserrat18.copyWith(
                      color: AppColors.error500,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            SafeArea(
              bottom: true,
              child: CustomButton(text: titel, onPressed: onContinue),
            ),
          ],
        ),
      ),
    );
  }
}
