import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/colors.dart';
import '../../../../core/themes/text_styles.dart';


class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12.r),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w),
          child: Row(
            children: [
              // === Icon ===
              Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  color: AppColors.primary50,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(
                  icon,
                  color: AppColors.primary500,
                  size: 20.r,
                ),
              ),

              SizedBox(width: 16.w),

              // === Title ===
              Expanded(
                child: Text(
                  title,
                  style: MediumMontserrat.mediumMontserrat16.copyWith(
                    color: AppColors.neutral900,
                  ),
                ),
              ),

              // === Trailing (Switch or Arrow) ===
              trailing ??
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16.r,
                    color: AppColors.neutral500,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}