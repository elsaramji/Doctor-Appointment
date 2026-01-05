import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:round_7_mobile_cure_team4/core/di/di.dart';
import 'package:round_7_mobile_cure_team4/core/routes/app_router.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';
import 'package:round_7_mobile_cure_team4/features/add_review/domain/entities/add_review_request_entity.dart';
import 'package:round_7_mobile_cure_team4/features/add_review/presentation/cubit/add_review_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/add_review/presentation/cubit/add_review_state.dart';
import 'package:round_7_mobile_cure_team4/features/doctor_details/presentation/widgets/custom_app_bar_widget.dart';
import 'package:round_7_mobile_cure_team4/features/doctor_details/presentation/widgets/custom_buttom_widget.dart';
import 'package:round_7_mobile_cure_team4/features/doctor_details/presentation/widgets/star_rating_widget.dart';

class AddReviewPage extends StatefulWidget {
  const AddReviewPage({super.key});

  @override
  State<AddReviewPage> createState() => _AddReviewPageState();
}

class _AddReviewPageState extends State<AddReviewPage> {
  double count = 0;
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddReviewCubit>(),
      child: Scaffold(
        appBar: CustomAppBarWidget(title: "Review"),
        body: BlocConsumer<AddReviewCubit, AddReviewState>(
          listener: (context, state) {
            state.whenOrNull(
              success: (response) {
                _showMyDialog();
              },
              error: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message)),
                );
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const Center(child: CircularProgressIndicator()),
              orElse: () => Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Rate",
                      style: RegularGeorgia.regularGeorgia18.copyWith(
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InteractiveStarRating(
                          initialRating: count,
                          onRatingChanged: (newValue) {
                            setState(() {
                              count = newValue;
                            });
                          },
                        ),
                        Text(
                          "${count.toStringAsFixed(1)}/5",
                          style: RegularGeorgia.regularGeorgia24.copyWith(
                            fontSize: 22.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    Text(
                      "Your review",
                      style: RegularGeorgia.regularGeorgia18.copyWith(
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    TextFormField(
                      controller: _commentController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: "Write your review",
                        hintStyle:
                        MediumMontserrat.mediumMontserrat14.copyWith(
                          color: AppColors.secondary100,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                        filled: true,
                        fillColor: AppColors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide: const BorderSide(
                            color: AppColors.secondary100,
                            width: 1.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide: const BorderSide(
                            color: AppColors.primaryDefault,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    SafeArea(
                      bottom: true,
                      child: CustomButtonWidget(
                        text: "Send your review",
                        onPressed: () {
                          final cubit = context.read<AddReviewCubit>();
                          final entity = AddReviewRequestEntity(
                            doctorId: 2,
                            rating: count.toInt(),
                            comment: _commentController.text,
                          );
                          cubit.addReview(entity);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          contentPadding: EdgeInsets.all(20.w),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset("assets/svg/approve_Image.svg", height: 90.h),
              SizedBox(height: 15.h),
              Text(
                "Thanks for your review",
                style: RegularGeorgia.regularGeorgia18,
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: double.infinity,
                height: 45.h,
                child: ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRoutes.doctorDetails);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondary500,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  child: Text(
                    "Done",
                    style: MediumMontserrat.mediumMontserrat16.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              TextButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRoutes.home);
                },
                child: Text(
                  "Back to Home",
                  style: MediumMontserrat.mediumMontserrat16.copyWith(
                    color: AppColors.secondary100,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
