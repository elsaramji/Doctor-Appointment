import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:round_7_mobile_cure_team4/core/di/di.dart';
import 'package:round_7_mobile_cure_team4/core/helper/assets.dart';
import 'package:round_7_mobile_cure_team4/core/routes/app_router.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';
import 'package:round_7_mobile_cure_team4/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/auth/presentation/cubit/login_cubit/login_state.dart';
import 'package:round_7_mobile_cure_team4/features/auth/presentation/widget/custom_buttons.dart';
import 'package:round_7_mobile_cure_team4/features/auth/presentation/widget/custom_phone_field.dart';
import 'package:round_7_mobile_cure_team4/features/auth/presentation/widget/lottie_dailog.dart';
import 'package:round_7_mobile_cure_team4/features/auth/presentation/widget/register_shimmer.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: BlocConsumer<LoginCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              final response = state.response;
              final isSuccess = response.success;

              final String? nextRoute = isSuccess ? AppRoutes.otp : null;

              final String dialogTitle = isSuccess
                  ? 'Login successful!'
                  : 'Operation Failed';
              final String dialogMessage = isSuccess
                  ? 'Go to OTP page to verify your account'
                  : response.message;

              showAnimatedCustomDialog(
                context: context,
                nextRoute: nextRoute,
                image: isSuccess ? LottieImages.success : LottieImages.error,
                title: dialogTitle,
                message: dialogMessage,
                extra: isSuccess
                    ? {
                        'phone': context
                            .read<LoginCubit>()
                            .phoneController
                            .text
                            .trim(),
                        'isLogin': true,
                        'email': "",
                      }
                    : null,
                isSuccess: isSuccess,
              );
            } else if (state is AuthFailure) {
              showAnimatedCustomDialog(
                context: context,
                image: LottieImages.error,
                title: 'Network Error',
                message: state.message,
                isSuccess: false,
              );
            }
          },
          builder: (context, state) {
            final cubit = context.read<LoginCubit>();
            final isLoading = state is AuthLoading;

            return SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 40.h),
                      Image.asset(
                        PngAssets.welcome,
                        height: 180.h,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 32.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Enter your phone number",
                          style: RegularGeorgia.regularGeorgia20.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      CustomPhoneField(controller: cubit.phoneController),
                      SizedBox(height: 32.h),

                      isLoading
                          ? const ButtonShimmer()
                          : CustomButtons(
                              text: "Sign in with your Phone Number",
                              onPressed: () {
                                if (cubit.formKey.currentState?.validate() ??
                                    false) {
                                  final phone = cubit.phoneController.text
                                      .trim();
                                  cubit.login(phone);
                                }
                              },
                            ),

                      SizedBox(height: 32.h),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(color: AppColors.secondary100),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Text(
                              "or",
                              style: RegularGeorgia.regularGeorgia14.copyWith(
                                color: AppColors.secondary200,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(color: AppColors.secondary100),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            SvgAssets.google,
                            height: 22.h,
                          ),
                          label: Text(
                            "Sign in with Google",
                            style: MediumMontserrat.mediumMontserrat14.copyWith(
                              color: AppColors.secondary200,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 14.h),
                            side: BorderSide(color: AppColors.secondary100),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 28.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don’t have an account?",
                            style: RegularGeorgia.regularGeorgia14.copyWith(
                              color: AppColors.secondary200,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => context.push(AppRoutes.signup),
                            child: Text(
                              " Sign up",
                              style: MediumMontserrat.mediumMontserrat14
                                  .copyWith(color: AppColors.primaryDefault),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
