import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/assets.dart';
import '../../../../core/themes/text_styles.dart';

// ignore: must_be_immutable
class ChatOverviewAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  bool isSelected;
  bool isSearch;
  int selectedCount;
  VoidCallback? onBack;
  ChatOverviewAppBar({
    super.key,
    required this.title,
    this.isSelected = false,
    this.isSearch = false,
    this.selectedCount = 0,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(left: 16.w, right: 16.w, top: 24.h),
      child: AppBar(
        title: AppBarTitle(title: isSelected ? '$selectedCount' : title),
        actions: isSelected ? _optionsBuilder : [_optionsBuilder.last],
        leading: isSelected || isSearch
            ? TextButton(
                onPressed: onBack,
                child: Image.asset(
                  IconsAssets.backArrow,
                  width: 20.sp,
                  height: 20.sp,
                  fit: BoxFit.contain,
                ),
              )
            : null,
      ),
    );
  }

  List<Widget> get _optionsBuilder {
    return [
      TextButton(
        child: Image.asset(
          IconsAssets.delete,
          width: 20.sp,
          height: 20.sp,
          fit: BoxFit.contain,
        ),
        onPressed: () {},
      ),
      TextButton(
        child: Image.asset(
          IconsAssets.pin,
          width: 20.sp,
          height: 20.sp,
          fit: BoxFit.contain,
        ),
        onPressed: () {},
      ),
      TextButton(
        child: Image.asset(
          IconsAssets.mute,
          width: 20.sp,
          height: 20.sp,
          fit: BoxFit.contain,
        ),
        onPressed: () {},
      ),
      TextButton(
        onPressed: () {},
        child: Image.asset(
          IconsAssets.dotsMenu,
          width: 20.sp,
          height: 20.sp,
          fit: BoxFit.contain,
        ),
      ),
    ];
  }

  @override
  Size get preferredSize => Size.fromHeight(71.h);
}

class AppBarTitle extends StatelessWidget {
  final String title;
  const AppBarTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title, style: RegularGeorgia.regularGeorgia24);
  }
}
