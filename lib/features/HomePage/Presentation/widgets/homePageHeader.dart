import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:round_7_mobile_cure_team4/core/helper/assets.dart';
import 'package:round_7_mobile_cure_team4/core/helper/convertAddresses.dart';
import 'package:round_7_mobile_cure_team4/core/routes/app_router.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';
import 'package:round_7_mobile_cure_team4/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/profile/presentation/cubit/profile_state.dart';

class HomePageHeader extends StatefulWidget {
  const HomePageHeader({super.key});

  @override
  State<HomePageHeader> createState() => _HomePageHeaderState();
}

class _HomePageHeaderState extends State<HomePageHeader> {
  Convertaddresses x = Convertaddresses();

  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().fetchProfile();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoaded) {
          final profile = state.profile;
          return ListTile(
            leading: InkWell(
              onTap: () => context.push(AppRoutes.profile),
              child: CircleAvatar(
                radius: 24.r,
                backgroundImage:
                    profile.imgUrl.isNotEmpty &&
                        profile.imgUrl.startsWith('http')
                    ? NetworkImage(profile.imgUrl)
                    : AssetImage(
                        'assets/images/homePageImages/307ce493-b254-4b2d-8ba4-d12c080d6651.jpg',
                      ),

                onBackgroundImageError: (_, __) {
                  print("Failed to load profile image, using default");
                },
              ),
            ),
            title: InkWell(
              onTap: () => context.push(AppRoutes.profile),
              child: Text(
                profile.fullName,
                style: RegularGeorgia.regularGeorgia14.apply(
                  color: AppColors.secondary500,
                ),
              ),
            ),

            subtitle: Row(
              children: [
                Flexible(
                  child: SvgPicture.asset(
                    SvgAssets.location,
                    width: 26.sp,
                    height: 26.sp,
                    fit: BoxFit.contain,
                    color: AppColors.neutral700,
                  ),
                ),

                Text(
                  profile.address.isNotEmpty
                      ? profile.address
                      : 'No address provided',
                  overflow: TextOverflow.ellipsis,
                  style: RegularMontserrat.regularMontserrat12,
                ),

                SizedBox(width: 2.w),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => Dialog(
                        child: Padding(
                          padding: EdgeInsets.all(25),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Your location",
                                style: RegularGeorgia.regularGeorgia24.apply(
                                  color: AppColors.secondary500,
                                ),
                              ),
                              SizedBox(height: 8),
                              Divider(),
                              Text(
                                profile.address.isNotEmpty
                                    ? profile.address
                                    : 'No address provided',
                                style: RegularMontserrat.regularMontserrat12,
                              ),
                              SizedBox(height: 16),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    side: const BorderSide(
                                      color: AppColors.primary500,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  context.pop();
                                  context.push(AppRoutes.profile);
                                },
                                child: Text(
                                  "Add new address",
                                  style: MediumMontserrat.mediumMontserrat14
                                      .apply(color: AppColors.primary500),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  icon: SvgPicture.asset(
                    SvgAssets.arrowDown,
                    width: 16.w,
                    height: 16.h,
                    color: AppColors.neutral700,
                  ),
                ),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _customContainer(SvgAssets.heart, () {
                  setState(() {
                    if (!mounted) return;

                    context.push(AppRoutes.favorite);
                  });
                }),

                SizedBox(width: 8.w),
                _customContainer(SvgAssets.bell, () {
                  setState(() {
                    if (!mounted) return;
                    context.push(AppRoutes.notifications);
                  });
                }),
              ],
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _customContainer(String image, VoidCallback onTap) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: IconButton(
        icon: SvgPicture.asset(
          image,
          width: 16.w,
          height: 16.h,
          color: AppColors.black,
        ),
        onPressed: onTap,
      ),
    );
  }
}
