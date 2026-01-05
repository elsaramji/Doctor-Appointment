import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:round_7_mobile_cure_team4/core/helper/token_storage.dart';
import 'package:round_7_mobile_cure_team4/core/routes/app_router.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';

class EmptyCardsScreen extends StatelessWidget {
  const EmptyCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/icons/card.png', height: 120.h, width: 120.w),
        SizedBox(height: 20.h),
        Text(
          "Nothing to display here!",
          style: MediumGeorgia.mediuGeorgia16.copyWith(
            color: AppColors.secondary500,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          "Add your cards to make payment easier",
          style: RegularMontserrat.regularMontserrat14.copyWith(
            color: AppColors.neutral600,
            fontSize: 14.sp,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 40.h),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            icon: Icon(Icons.add, size: 18.sp),
            label: Text(
              "Add Card",
              style: MediumMontserrat.mediumMontserrat16.copyWith(
                color: AppColors.white,
                fontSize: 16.sp,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryDefault,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              padding: EdgeInsets.symmetric(vertical: 14.h),
            ),
            onPressed: () async {
              final token = await TokenStorage().getAccessToken();

              if (token != null) {
                context.push(AppRoutes.addNewCard, extra: token);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('User not authenticated')),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
