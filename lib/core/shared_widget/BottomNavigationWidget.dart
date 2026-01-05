import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:round_7_mobile_cure_team4/core/helper/assets.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';
import '../routes/app_router.dart';
//
// class BottomNavigationWidget extends StatefulWidget {
//   final Widget child;
//   const BottomNavigationWidget({super.key, required this.child});
//
//   @override
//   State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
// }
//
// class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
//   final List<String> _routes = [
//     AppRoutes.home,
//     AppRoutes.myBooking,
//     AppRoutes.chat,
//     AppRoutes.profile,
//   ];
//
//   int _getCurrentIndex(BuildContext context) {
//     final location = GoRouterState.of(context).uri.toString();
//     int index = _routes.indexWhere((r) => location == r || location.startsWith('$r/'));
//     return index == -1 ? 0 : index;
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     final currentIndex = _getCurrentIndex(context);
//
//     return Scaffold(
//       body: widget.child,
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: currentIndex,
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: AppColors.primary500,
//         unselectedItemColor: AppColors.neutral500,
//         selectedLabelStyle: RegularMontserrat.regularMontserrat12,
//         unselectedLabelStyle: RegularMontserrat.regularMontserrat12,
//         onTap: (index) {
//           if (!mounted) return;
//           context.go(_routes[index]);
//         },
//
//
//         items: [
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//               currentIndex == 0 ? SvgAssets.home : SvgAssets.homeGrey,
//               width: 24.w,
//               height: 24.h,
//             ),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//               currentIndex == 1 ? SvgAssets.calendar_blue : SvgAssets.calendar_grey,
//               width: 24.w,
//               height: 24.h,
//             ),
//             label: 'Booking',
//           ),
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//               currentIndex == 2 ? SvgAssets.chat_blue : SvgAssets.chat_grey,
//               width: 24.w,
//               height: 24.h,
//             ),
//             label: 'Chat',
//           ),
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//               currentIndex == 3 ? SvgAssets.Profile_blue : SvgAssets.Profile_grey,
//               width: 24.w,
//               height: 24.h,
//             ),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }


class BottomNavigationWidget extends StatelessWidget {
  final Widget child;

  const BottomNavigationWidget({
    super.key,
    required this.child,
  });


  static const List<String> _routes = [
    AppRoutes.home,
    AppRoutes.myBooking,
    AppRoutes.chat,
    AppRoutes.profile,
  ];

  static int getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;

    if (location.startsWith(AppRoutes.profile)) return 3;
    if (location == AppRoutes.home) return 0;
    if (location == AppRoutes.myBooking) return 1;
    if (location == AppRoutes.chat) return 2;

    return 0; // fallback
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = getCurrentIndex(context);

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary500,
        unselectedItemColor: AppColors.neutral500,
        selectedLabelStyle: RegularMontserrat.regularMontserrat12,
        unselectedLabelStyle: RegularMontserrat.regularMontserrat12,
        onTap: (index) {
          context.go(_routes[index]);
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              currentIndex == 0 ? SvgAssets.home : SvgAssets.homeGrey,
              width: 24.w,
              height: 24.h,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              currentIndex == 1 ? SvgAssets.calendar_blue : SvgAssets.calendar_grey,
              width: 24.w,
              height: 24.h,
            ),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              currentIndex == 2 ? SvgAssets.chat_blue : SvgAssets.chat_grey,
              width: 24.w,
              height: 24.h,
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              currentIndex == 3 ? SvgAssets.Profile_blue : SvgAssets.Profile_grey,
              width: 24.w,
              height: 24.h,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}