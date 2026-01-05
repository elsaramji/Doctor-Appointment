import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';

class DrawHistory extends StatefulWidget {
  final String str;

  final VoidCallback? onPressed;
  const DrawHistory({super.key, required this.str, this.onPressed});

  @override
  State<DrawHistory> createState() => _DrawHistoryState();
}

class _DrawHistoryState extends State<DrawHistory> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,

      child: Container(
        margin: EdgeInsets.all(1.w),
        height: 50.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.neutral500),
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.str,
              style: RegularMontserrat.regularMontserrat16.apply(
                color: AppColors.neutral900,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
