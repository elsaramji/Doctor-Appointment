import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:round_7_mobile_cure_team4/core/di/di.dart';
import 'package:round_7_mobile_cure_team4/core/helper/assets.dart';
import 'package:round_7_mobile_cure_team4/core/routes/app_router.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';
import 'package:round_7_mobile_cure_team4/features/auth/presentation/cubit/verify_cubit/verify_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/auth/presentation/cubit/verify_cubit/verify_state.dart';
import 'package:round_7_mobile_cure_team4/features/auth/presentation/widget/custom_buttons.dart';
import 'package:round_7_mobile_cure_team4/features/auth/presentation/widget/lottie_dailog.dart';
import 'package:round_7_mobile_cure_team4/features/auth/presentation/widget/register_shimmer.dart';
import '../../domain/entities/verify_entity/verify_request_entity.dart';

class OtpPage extends StatelessWidget {
  final String phoneNumber;
  final bool isLogin;

  const OtpPage({super.key, required this.phoneNumber, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<VerifyCubit>()..startOtpTimer(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "OTP Verification",
            style: MediumMontserrat.mediumMontserrat20.copyWith(
              color: AppColors.primary900,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: AppColors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColors.black, size: 22.sp),
            onPressed: () => GoRouter.of(context).pop(),
          ),
        ),
        body: _OtpPageBody(
          phoneNumber: phoneNumber,
          isLogin: isLogin,
        ),
      ),
    );
  }
}

class _OtpPageBody extends StatefulWidget {
  final String phoneNumber;
  final bool isLogin;

  const _OtpPageBody({required this.phoneNumber, required this.isLogin});

  @override
  State<_OtpPageBody> createState() => __OtpPageBodyState();
}

class __OtpPageBodyState extends State<_OtpPageBody> {
  final TextEditingController _pinController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _pinController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _verifyOtp(BuildContext context) {
    final cubit = context.read<VerifyCubit>();
    String otp = _pinController.text;

    if (otp.length < 4) {
      showAnimatedCustomDialog(
        context: context,
        image: LottieImages.error,
        message: 'Please enter complete 4-digit OTP',
        nextRoute: AppRoutes.otp,
        isSuccess: false,
      );
      return;
    }

    final request = VerifyRequestEntity(
      phoneNumber: widget.phoneNumber,
      otpNumber: otp,
    );

    if (widget.isLogin) {
      cubit.verifyLoginOtp(request);
    } else {
      cubit.verifySignUpOtp(request);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyCubit, VerifyState>(
      listener: (context, state) {
        state.whenOrNull(
          loginSuccess: (_) {
            context.go(AppRoutes.home);
          },
          signUpSuccess: (_) {
            context.go(AppRoutes.home);
          },
          loginFailure: (error) {
            showAnimatedCustomDialog(
              context: context,
              image: LottieImages.error,
              message: error,
              isSuccess: false,
            );
          },
          signUpFailure: (error) {
            showAnimatedCustomDialog(
              context: context,
              image: LottieImages.error,
              message: error,
              isSuccess: false,
            );
          },
        );
      },
      child: BlocBuilder<VerifyCubit, VerifyState>(
        builder: (context, state) {
          int secondsRemaining = 60;
          bool canResend = false;
          bool isLoading = state.maybeWhen(
            loginLoading: () => true,
            signUpLoading: () => true,
            orElse: () => false,
          );

          state.whenOrNull(
            timerUpdated: (seconds, resend) {
              secondsRemaining = seconds;
              canResend = resend;
            },
          );

          return _buildOtpForm(context, secondsRemaining, canResend, isLoading);
        },
      ),
    );
  }

  Widget _buildOtpForm(
      BuildContext context,
      int secondsRemaining,
      bool canResend,
      bool isLoading,
      ) {
    final maskedNumber =
        '+${widget.phoneNumber.substring(0, 6)}***${widget.phoneNumber.substring(widget.phoneNumber.length - 2)}';

    final defaultPinTheme = PinTheme(
      width: 60.w,
      height: 60.w,
      textStyle: MediumMontserrat.mediumMontserrat24.copyWith(
        color: AppColors.primary900,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary50,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.primaryDefault, width: 1.5),
      ),
    );

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 32.h),
            Text(
              "Code has been sent to $maskedNumber",
              style: RegularGeorgia.regularGeorgia16.copyWith(
                color: AppColors.secondary200,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.h),
            Pinput(
              length: 4,
              controller: _pinController,
              focusNode: _focusNode,
              defaultPinTheme: defaultPinTheme,
              onCompleted: (pin) => _verifyOtp(context),
            ),
            SizedBox(height: 24.h),
            TextButton(
              onPressed: canResend
                  ? () => context.read<VerifyCubit>().startOtpTimer()
                  : null,
              child: canResend
                  ? RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Resend  ",
                      style: RegularMontserrat.regularMontserrat14.copyWith(
                        color: AppColors.primary500,
                      ),
                    ),
                    TextSpan(
                      text: "or",
                      style: RegularMontserrat.regularMontserrat14.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    TextSpan(
                      text: "  Enter another phone number",
                      style: RegularMontserrat.regularMontserrat14.copyWith(
                        color: AppColors.primary500,
                      ),
                    ),
                  ],
                ),
              )
                  : RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Resend Code in ",
                      style: RegularMontserrat.regularMontserrat14.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    TextSpan(
                      text: secondsRemaining.toString().padLeft(2, '0'),
                      style: RegularMontserrat.regularMontserrat14.copyWith(
                        color: AppColors.primary500,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: " Sec",
                      style: RegularMontserrat.regularMontserrat14.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 32.h),
            isLoading
                ? const ButtonShimmer()
                : CustomButtons(
              text: "Verify",
              onPressed: () {
                _verifyOtp(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}