import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:round_7_mobile_cure_team4/core/helper/assets.dart';
import 'package:round_7_mobile_cure_team4/core/routes/app_router.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_confirm_dialog.dart';
import '../../widgets/menu_tile.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: 'Settings',
        backgroundColor: AppColors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Column(
          children: [
            // MenuTile(
            //   SvgAssets.keySquare2,
            //   'Password Management',
            //   route: '/profile/settings/password_management',
            // ),
            MenuTile(
              SvgAssets.userRounded,
              'Delete Account',
              color: AppColors.error600,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => CustomConfirmDialog(
                    title: 'Delete Account',
                    message: 'Are you sure you want to delete your account?',
                    confirmText: 'Delete',
                    cancelText: 'Cancel',
                    confirmColor: AppColors.error600,
                    onConfirm: () {
                      context.go(AppRoutes.signup);
                      //Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: AppColors.error600,
                          content: Text('Account deleted!'),
                        ),

                      );

                    },
                  ),
                );
              },
            ),
          ],
        )

      ),
    );
  }
}
