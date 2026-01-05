
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';


class PaymentTile extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;

  const PaymentTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
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
            /// ICON BOX (always aligned)
            Container(
              width: 30.w,
              height: 30.w,
              alignment: Alignment.center,
              child: SvgPicture.asset(
                icon,
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

            Icon(
              Icons.chevron_right,
              color: AppColors.neutral600,
              size: 22.sp,
            ),
          ],
        ),
      ),
    );
  }
}
