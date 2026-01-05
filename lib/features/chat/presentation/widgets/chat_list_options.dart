import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/di.dart';
import '../../../../core/themes/colors.dart';
import '../../../../core/themes/text_styles.dart';
import '../cubits/chats_cubit_cubit.dart';

// ignore: must_be_immutable
class ChatListOptions extends StatefulWidget {
  final String title;
  bool isSelected;
  ChatListOptions({super.key, required this.title, this.isSelected = false});

  @override
  State<ChatListOptions> createState() => _ChatListOptionsState();
}

class _ChatListOptionsState extends State<ChatListOptions> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ChatsCubit>(),
      child: GestureDetector(
        onTap: () {
          if (widget.title == "All") {
            context.read<ChatsCubit>().getChats();
            setState(() {
              widget.isSelected = !widget.isSelected;
            });
          } else if (widget.title == "Unread") {
            context.read<ChatsCubit>().getUnreadChats();
            setState(() {
              widget.isSelected = !widget.isSelected;
            });
          } else if (widget.title == "Favorite") {}
        },
        child: Container(
          height: 36.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: widget.isSelected
                ? AppColors.primaryDefault
                : Colors.transparent,
            borderRadius: BorderRadius.circular(13.r),
          ),
          child: Text(
            widget.title,
            style: RegularMontserrat.regularMontserrat14.copyWith(
              color: widget.isSelected
                  ? AppColors.white
                  : AppColors.neutralDefault,
            ),
          ),
        ),
      ),
    );
  }
}
