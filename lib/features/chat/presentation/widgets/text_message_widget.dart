import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';

class TextMessageWidget extends StatelessWidget {
  final String message;
  final bool isMe;

  const TextMessageWidget({
    super.key,
    required this.message,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: 0.7.sw),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          margin: EdgeInsets.only(bottom: 8.h),
          decoration: BoxDecoration(
            color: isMe ? AppColors.primaryDefault : AppColors.neutral300,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r),
              topRight: Radius.circular(10.r),
              bottomRight: isMe ? Radius.circular(10.r) : Radius.zero,
              bottomLeft: isMe ? Radius.zero : Radius.circular(10.r),
            ),
          ),
          child: Text(
            message,
            style: RegularMontserrat.regularMontserrat16.copyWith(
              color: isMe ? AppColors.white : AppColors.secondaryDefault,
            ),
          ),
        ),
      ],
    );
  }
}
