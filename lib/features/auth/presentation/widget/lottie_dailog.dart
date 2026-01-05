import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showAnimatedCustomDialog({
  required BuildContext context,
  required String image,
  required String message,
  String? title,
  required bool isSuccess,
  String? nextRoute,
  Map<String, dynamic>? extra,
  bool replace = false,
}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: false,
    barrierLabel: '',
    barrierColor: Colors.black.withOpacity(0.45),
    transitionDuration: const Duration(milliseconds: 280),
    pageBuilder: (_, __, ___) => const SizedBox(),
    transitionBuilder: (context, anim, __, ___) {
      final curvedValue = Curves.easeOutBack.transform(anim.value);

      return Transform.scale(
        scale: curvedValue,
        child: Opacity(
          opacity: anim.value,
          child: Dialog(
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Padding(
              padding: EdgeInsets.all(24.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Animation
                  SizedBox(
                    height: 130.h,
                    child: Lottie.asset(
                      image,
                      repeat: false,
                      fit: BoxFit.contain,
                    ),
                  ),

                  SizedBox(height: 10.h),

                  // Title
                  if (title != null)
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                        height: 1.3,
                        color: isSuccess
                            ? Colors.green.shade600
                            : Colors.red.shade600,
                        letterSpacing: 0.3,
                      ),
                    ),

                  if (title != null) SizedBox(height: 12.h),

                  // Message
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.sp,
                      height: 1.5,
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  SizedBox(height: 24.h),

                  // Continue Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: isSuccess
                              ? Colors.green.shade600
                              : Colors.red.shade600,
                          width: 2.2.w,
                        ),
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {
                        context.pop();

                        if (nextRoute != null) {
                          if (replace) {
                            context.go(nextRoute, extra: extra);
                          } else {
                            context.push(nextRoute, extra: extra);
                          }
                        }
                      },
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: isSuccess
                              ? Colors.green.shade600
                              : Colors.red.shade600,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}