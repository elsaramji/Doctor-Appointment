
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';

class MobileWallets extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  const MobileWallets({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 14.w),
        decoration: BoxDecoration(
          color: AppColors.neutral50,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Container(
              width: 28.w,
              height: 28.w,   // square box = consistent alignment
              alignment: Alignment.center,
              child: SvgPicture.asset(
                icon,
                width: 20.w,
                height: 20.w,
                fit: BoxFit.contain,
              ),
            ),

            SizedBox(width: 12.w),

            Expanded(
              child: Text(
                title,
                style: MediumMontserrat.mediumMontserrat16.copyWith(
                  color: AppColors.secondary500,
                  fontSize: 16.sp,
                ),
              ),
            ),

            /// Radio Button
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off,
              color:
              isSelected ? AppColors.primaryDefault : AppColors.neutral600,
              size: 20.sp,
            ),
          ],
        ),
      ),
    );
  }
}
