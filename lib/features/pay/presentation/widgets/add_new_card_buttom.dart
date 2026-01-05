import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';

class AddNewCardButton extends StatelessWidget {
  final VoidCallback? onTap;
  const AddNewCardButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          dashPattern: const [6, 3],
          strokeWidth: 1.8.w,
          radius: Radius.circular(10.r),
          color: AppColors.primaryDefault,
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, color: AppColors.primaryDefault, size: 22.sp),
            SizedBox(width: 8.w),
            Text(
              'Add New Card',
              style: MediumMontserrat.mediumMontserrat16.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.primaryDefault,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
