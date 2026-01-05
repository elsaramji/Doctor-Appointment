import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';
import 'package:round_7_mobile_cure_team4/features/onboarding/presentation/pages/onboarding_page.dart';

class OnboardingScreen extends StatelessWidget {
  final OnboardingData data;

  const OnboardingScreen({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 40.h),
          _buildIllustration(),
          SizedBox(height: 60.h),
          Text(
            data.title,
            style: RegularGeorgia.regularGeorgia24.copyWith(
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.neutral900,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),
          Text(
            data.description,
            style: RegularMontserrat.regularMontserrat14.copyWith(
              fontSize: 16.sp,
              color: AppColors.secondary200,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildIllustration() {
    if (data.illustration == Icons.calendar_today) {
      return _buildBookingIllustration();
    } else {
      return _buildLocationIllustration();
    }
  }

  Widget _buildBookingIllustration() {
    return SizedBox(
      width: 300.w,
      height: 300.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 200.w,
            height: 200.h,
            decoration: BoxDecoration(
              color: AppColors.primary50,
              shape: BoxShape.circle,
            ),
          ),
          Positioned(
            child: Icon(
              Icons.phone_android,
              size: 120.sp,
              color: AppColors.primaryDefault,
            ),
          ),
          Positioned(
            top: 20.h,
            child: Icon(
              Icons.medical_services,
              size: 40.sp,
              color: AppColors.primaryDefault,
            ),
          ),
          Positioned(
            top: 20.h,
            right: 40.w,
            child: Icon(
              Icons.medication,
              size: 30.sp,
              color: AppColors.primaryDefault,
            ),
          ),
          Positioned(
            bottom: 40.h,
            right: 20.w,
            child: Icon(
              Icons.description,
              size: 30.sp,
              color: AppColors.primaryDefault,
            ),
          ),
          Positioned(
            bottom: 20.h,
            left: 40.w,
            child: Icon(
              Icons.calendar_today,
              size: 30.sp,
              color: AppColors.primaryDefault,
            ),
          ),
          Positioned(
            top: 40.h,
            left: 20.w,
            child: Icon(
              Icons.favorite,
              size: 30.sp,
              color: AppColors.primaryDefault,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationIllustration() {
    return SizedBox(
      width: 300.w,
      height: 300.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 250.w,
            height: 250.h,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.primaryDefault,
                width: 2,
                style: BorderStyle.solid,
              ),
              shape: BoxShape.circle,
            ),
          ),
          Icon(
            Icons.location_on,
            size: 80.sp,
            color: AppColors.primaryDefault,
          ),
          Positioned(
            top: 20.h,
            left: 40.w,
            child: _buildDoctorAvatar(),
          ),
          Positioned(
            top: 20.h,
            right: 40.w,
            child: _buildDoctorAvatar(),
          ),
          Positioned(
            left: 20.w,
            child: _buildDoctorAvatar(),
          ),
          Positioned(
            bottom: 20.h,
            left: 40.w,
            child: _buildDoctorAvatar(),
          ),
          Positioned(
            bottom: 20.h,
            right: 40.w,
            child: _buildDoctorAvatar(),
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorAvatar() {
    return Container(
      width: 50.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: AppColors.primaryDefault,
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.white,
          width: 2,
        ),
      ),
      child: Icon(
        Icons.person,
        color: AppColors.white,
        size: 30.sp,
      ),
    );
  }
}

