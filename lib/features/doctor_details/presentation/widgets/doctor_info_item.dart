import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';

class DoctorInfoItem extends StatelessWidget {
  final String icon;
  final String value;
  final String label;
  final Color? iconColor;
  final Color? textColor;
  final double? heightIconSize;
  final double? widthIconSize;

  const DoctorInfoItem({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
    this.iconColor,
    this.textColor,
    this.heightIconSize,
    this.widthIconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          icon,
          fit: BoxFit.cover,
          color: iconColor,
          height: heightIconSize?.h ?? 30.h,
          width: widthIconSize?.w ?? 30.w,
        ),
        SizedBox(height: 8.h),
        Text(
          value,
          style: RegularMontserrat.regularMontserrat14.copyWith(
            color: textColor ?? AppColors.secondary400,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          label,
          style: RegularMontserrat.regularMontserrat14.copyWith(
            color: AppColors.secondary200,
            fontSize: 13.sp,
          ),
        ),
      ],
    );
  }
}
