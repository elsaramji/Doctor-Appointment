import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:round_7_mobile_cure_team4/core/helper/assets.dart';
import 'package:round_7_mobile_cure_team4/core/themes/app_theme.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/profile/presentation/cubit/profile_state.dart';
import 'package:round_7_mobile_cure_team4/features/profile/presentation/widgets/custom_confirm_dialog.dart';
import 'package:round_7_mobile_cure_team4/features/profile/presentation/widgets/menu_tile.dart';

import '../../../../core/helper/api_constants.dart';
import '../../../../core/helper/dio_helper.dart';
import '../../../../core/helper/token_storage.dart';
import '../../../../core/routes/app_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isNotificationOn = true;

  void _toggleNotification() async {
    final token = await GetIt.I<TokenStorage>().getAccessToken();
    try {
      final response = await DioHelper().putRequest(
        '/api/Profile/NotificationSettings/toggle',
        null, // No body needed
        headers: {'Authorization': 'Bearer $token'},
      );
      // Check if the response indicates success
      if (response != null && response.statusCode == 200) {
        setState(() {
          _isNotificationOn = !_isNotificationOn; // update state variable
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              _isNotificationOn
                  ? 'Notifications turned ON 🔔'
                  : 'Notifications turned OFF 🔕',
            ),
            duration: const Duration(seconds: 1),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to toggle notifications.'),
            duration: Duration(seconds: 1),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to toggle notifications.'),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  void _navigateTo(BuildContext context, String routeName) {
    context.push(routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.lightTheme,
      child: Scaffold(
        body: SafeArea(
          top: true,
          child: BlocListener<ProfileCubit, ProfileState>(
            listener: (context, state) {
              if (state is ProfileUpdateSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Profile updated successfully!'),
                  ),
                );

                context.read<ProfileCubit>().fetchProfile();
              } else if (state is ProfileUpdateFailure) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                if (state is ProfileLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ProfileError) {
                  return Center(child: Text(state.message));
                } else if (state is ProfileLoaded) {
                  final profile = state.profile;
                  return SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Profile Card
                        InkWell(
                          onTap: () async {
                            final updated = await context.push(
                              AppRoutes.editProfile,
                            );

                            if (updated == true) {
                              context.read<ProfileCubit>().fetchProfile();
                            }
                          },

                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 28,

                                  child: profile.imgUrl.isNotEmpty
                                      ? Image.network(
                                          ApiConstant.baseUrl + profile.imgUrl,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                                return Image.asset(
                                                  'assets/images/homePageImages/307ce493-b254-4b2d-8ba4-d12c080d6651.jpg',
                                                  fit: BoxFit.cover,
                                                );
                                              },
                                        )
                                      : Image.asset(
                                          'assets/images/homePageImages/307ce493-b254-4b2d-8ba4-d12c080d6651.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                ),

                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        profile.fullName,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.neutral900,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        profile.address.isNotEmpty
                                            ? profile.address
                                            : 'No address provided',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: AppColors.neutral600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(
                                  Icons.chevron_right,
                                  color: AppColors.neutral600,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Notification Switch
                        _buildSwitchTile('Notification', _isNotificationOn, (
                          value,
                        ) {
                          _toggleNotification();
                        }),

                        const SizedBox(height: 20),

                        // Menu Tiles
                        MenuTile(
                          SvgAssets.banknote,
                          'Payment Method',
                          route: AppRoutes.payment,
                        ),
                        const SizedBox(height: 20),
                        MenuTile(
                          SvgAssets.heart,
                          'Favorite',
                          route: AppRoutes.favorite,
                        ),
                        const SizedBox(height: 20),
                        MenuTile(
                          SvgAssets.settings,
                          'Settings',
                          route: AppRoutes.settings,
                        ),
                        const SizedBox(height: 20),
                        MenuTile(
                          SvgAssets.chatLine,
                          'FAQs',
                          route: AppRoutes.faqs,
                        ),
                        const SizedBox(height: 20),
                        MenuTile(
                          SvgAssets.lock,
                          'Privacy Policy',
                          route: 'profile/privacy_policy',
                        ),
                        const SizedBox(height: 20),

                        MenuTile(
                          SvgAssets.logout,
                          'Log out',
                          color: AppColors.error500,
                          onTap: () async {
                            final confirm = await showDialog<bool>(
                              context: context,
                              builder: (_) => CustomConfirmDialog(
                                title: 'Log Out',
                                message: 'Are you sure you want to log out?',
                                confirmText: 'Log Out',
                                cancelText: 'Cancel',
                                confirmColor: AppColors.error600,
                                onConfirm: () async {
                                  await GetIt.I<TokenStorage>().clearTokens();
                                  // final tokenStorage = getIt<TokenStorage>();
                                  // final accessToken = await tokenStorage.getAccessToken();
                                  // print('🎯 Access Token after logout: $accessToken');
                                  Navigator.of(
                                    context,
                                    rootNavigator: true,
                                  ).pop();
                                  WidgetsBinding.instance.addPostFrameCallback((
                                    _,
                                  ) {
                                    context.go(AppRoutes.login);
                                  });
                                },
                              ),
                            );

                            if (confirm == true) {
                              final response = await DioHelper().logout();

                              if (response != null &&
                                  response.statusCode == 200) {
                                context.go(AppRoutes.login);
                              } else {
                                WidgetsBinding.instance.addPostFrameCallback((
                                  _,
                                ) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: AppColors.error500,
                                      content: const Text(
                                        'Logout failed. Please try again.',
                                      ),
                                    ),
                                  );
                                });
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchTile(String title, bool value, Function(bool) onChanged) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          SvgPicture.asset(SvgAssets.bell, color: AppColors.black),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, color: AppColors.neutral900),
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: AppColors.success500,
            inactiveThumbColor: AppColors.neutral300,
            inactiveTrackColor: AppColors.neutral200,
          ),
        ],
      ),
    );
  }
}
