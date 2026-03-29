import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:round_7_mobile_cure_team4/core/di/di.dart';
import 'package:round_7_mobile_cure_team4/core/helper/assets.dart';
import 'package:round_7_mobile_cure_team4/core/routes/app_router.dart';
import 'package:round_7_mobile_cure_team4/core/shared_widget/custom_text_filed.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';
import 'package:round_7_mobile_cure_team4/features/auth/presentation/cubit/register_cubit/register_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/auth/presentation/cubit/register_cubit/register_state.dart';
import 'package:round_7_mobile_cure_team4/features/auth/presentation/widget/custom_buttons.dart';
import 'package:round_7_mobile_cure_team4/features/auth/presentation/widget/custom_phone_field.dart';
import 'package:round_7_mobile_cure_team4/features/auth/presentation/widget/lottie_dailog.dart';
import 'package:round_7_mobile_cure_team4/features/auth/presentation/widget/register_shimmer.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<RegisterCubit>(),
      child: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            final cubit = context.read<RegisterCubit>();
            final response = state.response;
            final isSuccess = response.success;
            showAnimatedCustomDialog(
              context: context,
              nextRoute: isSuccess ? AppRoutes.otp : AppRoutes.signup,
              image: isSuccess ? LottieImages.success : LottieImages.error,
              title: isSuccess ? 'User created!' : response.message,
              message: isSuccess
                  ? 'Go to OTP page to verify your account'
                  : 'Please try again',
              extra: isSuccess
                  ? {
                      'phone': cubit.phoneController.text.trim(),
                      'email': cubit.emailController.text.trim(),
                      'isLogin': false,
                    }
                  : null,
              isSuccess: isSuccess,
            );
          } else if (state is RegisterFailure) {
            showAnimatedCustomDialog(
              context: context,
              nextRoute: AppRoutes.signup,
              image: LottieImages.error,
              title: state.message,
              message: 'Please try again',
              isSuccess: false,
            );
          }
        },
        child: _RegisterForm(),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();

    return Scaffold(
      backgroundColor: AppColors.neutral50,
      appBar: AppBar(
        backgroundColor: AppColors.neutral50,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.neutral900,
            size: 22.sp,
          ),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Form(
          key: cubit.formKey,
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  PngAssets.bsHeartPulse,
                  height: 75.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 24.h),
              Center(
                child: Text(
                  'Create New Account',
                  style: RegularGeorgia.regularGeorgia20.copyWith(
                    color: AppColors.black,
                    fontSize: 32,
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              CustomTextField(
                hint: 'Full name',
                validator: (value) {
                  if (value == null || value.trim().isEmpty)
                    return "Name is required";
                  if (value.trim().length < 2)
                    return "Name must be at least 2 characters";
                  if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value.trim()))
                    return "Name can only contain letters and spaces";
                  return null;
                },
                controller: cubit.nameController,
                prefixWidget: Icon(
                  Icons.person_outline,
                  color: AppColors.neutral500,
                  size: 22.sp,
                ),
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 16.h),
              CustomTextField(
                hint: 'Email',
                controller: cubit.emailController,
                prefixWidget: Icon(
                  Icons.email_outlined,
                  color: AppColors.neutral500,
                  size: 22.sp,
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16.h),
              CustomPhoneField(controller: cubit.phoneController),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<RegisterCubit, RegisterState>(
                    builder: (context, state) {
                      return Checkbox(
                        value: cubit.isRememberMe,
                        activeColor: AppColors.primary500,
                        onChanged: (val) {},
                        side: BorderSide(
                          color: AppColors.primary500,
                          width: 1.5,
                        ),
                      );
                    },
                  ),
                  Text(
                    'Remember me',
                    style: RegularMontserrat.regularMontserrat14.copyWith(
                      color: AppColors.neutral700,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              BlocBuilder<RegisterCubit, RegisterState>(
                builder: (context, state) {
                  if (state is RegisterLoading) {
                    return const ButtonShimmer();
                  }
                  return CustomButtons(
                    text: "Sign up",
                    onPressed: () {
                      if (cubit.formKey.currentState?.validate() ?? false) {
                        cubit.register(
                          phoneNumber: cubit.phoneController.text.trim(),
                          name: cubit.nameController.text.trim(),
                          email: cubit.emailController.text.trim(),
                        );
                      }
                    },
                  );
                },
              ),
              SizedBox(height: 32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: RegularGeorgia.regularGeorgia14.copyWith(
                      color: AppColors.secondary200,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => context.push(AppRoutes.login),
                    child: Text(
                      "Sign in",
                      style: MediumMontserrat.mediumMontserrat14.copyWith(
                        color: AppColors.primaryDefault,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
