// // import 'package:flutter/material.dart';
// // import 'package:go_router/go_router.dart';
// // import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
// //
// // class CustomMenuTile extends StatelessWidget {
// //   final IconData icon;
// //   final String title;
// //   final String route;
// //   final Color? color;
// //
// //   const CustomMenuTile({
// //     super.key,
// //     required this.icon,
// //     required this.title,
// //     required this.route,
// //     this.color, required Null Function() onTap,
// //   });
// //
// //   void _navigateTo(BuildContext context) {
// //     GoRouter.of(context).push(route);
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return InkWell(
// //       onTap: () => _navigateTo(context),
// //       borderRadius: BorderRadius.circular(12),
// //       child: Container(
// //         margin: const EdgeInsets.only(bottom: 8),
// //         padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
// //         decoration: BoxDecoration(
// //           color: AppColors.neutral50,
// //           borderRadius: BorderRadius.circular(12),
// //         ),
// //         child: Row(
// //           children: [
// //             Icon(icon, color: color ?? AppColors.neutral700),
// //             const SizedBox(width: 12),
// //             Expanded(
// //               child: Text(
// //                 title,
// //                 style: TextStyle(
// //                   fontSize: 16,
// //                   color: color ?? AppColors.neutral900,
// //                 ),
// //               ),
// //             ),
// //             Icon(Icons.chevron_right, color: AppColors.neutral600),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
// import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';
//
// class CustomMenuTile extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final String? route;
//   final Color? color;
//   final VoidCallback? onTap;
//
//   const CustomMenuTile({
//     super.key,
//     required this.icon,
//     required this.title,
//     this.route,
//     this.color,
//     this.onTap,
//   });
//
//   void _navigateTo(BuildContext context) {
//     if (route != null && route!.isNotEmpty) {
//       GoRouter.of(context).push(route!);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap ?? () => _navigateTo(context),
//       borderRadius: BorderRadius.circular(12.r),
//       child: Container(
//         margin: EdgeInsets.only(bottom: 12.h),
//         padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
//         decoration: BoxDecoration(
//           color: AppColors.neutral50,
//           borderRadius: BorderRadius.circular(12.r),
//         ),
//         child: Row(
//           children: [
//             Icon(icon, color: color ?? AppColors.secondaryDefault, size: 20.sp),
//             SizedBox(width: 12.w),
//             Expanded(
//               child: Text(
//                 title,
//                 style: MediumMontserrat.mediumMontserrat14.copyWith(
//                   color: color ?? AppColors.secondaryDefault,
//                 ),
//               ),
//             ),
//             Icon(Icons.arrow_forward_ios, color: AppColors.neutral600, size: 16.sp),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';

class MenuTile extends StatelessWidget {
  final String icon;
  final String title;
  final String? route;
  final VoidCallback? onTap;
  final Color? color;

  const MenuTile(
      this.icon,
      this.title, {
        super.key,
        this.route,
        this.onTap,
        this.color,
      });

  void _navigateTo(BuildContext context) {
    if (route != null) {
      GoRouter.of(context).push(route!);
    } else if (onTap != null) {
      onTap!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _navigateTo(context),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon,color: color ?? AppColors.black,),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: color ?? AppColors.neutral900,
                ),
              ),
            ),
            if (route != null)
              Icon(Icons.chevron_right, color: AppColors.neutral600),
          ],
        ),
      ),
    );
  }
}
