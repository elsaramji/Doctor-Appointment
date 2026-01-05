import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:round_7_mobile_cure_team4/core/helper/assets.dart';

class Banner extends StatelessWidget {
  const Banner({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: false,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(24.r)),
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        child: Image.asset(ImageAssets.banner, fit: BoxFit.cover),
      ),
    );
  }
}
