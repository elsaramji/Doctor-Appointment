import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:round_7_mobile_cure_team4/core/routes/app_router.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';
import 'package:round_7_mobile_cure_team4/features/chat/domain/entities/chat_entity.dart';

import '../../../../core/helper/assets.dart';
import '../../../../core/themes/colors.dart';

class ChatConversionAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final ChatEntity conversation;
  const ChatConversionAppBar({super.key, required this.conversation});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: TextButton(
        onPressed: () {
          context.pop();
        },
        child: Image.asset(
          IconsAssets.backArrow,
          width: 20.sp,
          height: 20.sp,
          fit: BoxFit.contain,
        ),
      ),
      title: Row(
        children: [
          ClipOval(
            clipBehavior: Clip.hardEdge,
            child: Image.network(
              conversation.img,
              width: 40.sp,
              height: 40.sp,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 40.sp,
                  height: 40.sp,
                  color: AppColors.secondary100,
                  child: Icon(
                    Icons.person,
                    color: AppColors.white,
                    size: 24.sp,
                  ),
                );
              },
            ),
          ),
          SizedBox(width: 10.w),
          Text(
            conversation.doctorName,
            overflow: TextOverflow.clip,
            style: RegularGeorgia.regularGeorgia16,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.push(AppRoutes.voiceCall, extra: conversation);
          },
          child: Image.asset(
            IconsAssets.call,
            width: 20.sp,
            height: 20.sp,
            fit: BoxFit.contain,
          ),
        ),
        TextButton(
          onPressed: () {
            context.push(AppRoutes.videoCall, extra: conversation);
          },
          child: Image.asset(
            IconsAssets.videoCall,
            width: 20.sp,
            height: 20.sp,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(88.h);
}
