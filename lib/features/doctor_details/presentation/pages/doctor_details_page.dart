import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:round_7_mobile_cure_team4/core/di/di.dart';
import 'package:round_7_mobile_cure_team4/core/helper/assets.dart';
import 'package:round_7_mobile_cure_team4/core/routes/app_router.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/cubit/favorite/favorite_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/chat/presentation/cubits/chats_cubit_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/doctor_details/presentation/cubit/doctor_details_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/doctor_details/presentation/cubit/doctor_details_state.dart';
import 'package:round_7_mobile_cure_team4/features/doctor_details/presentation/widgets/custom_app_bar_widget.dart';
import 'package:round_7_mobile_cure_team4/features/doctor_details/presentation/widgets/custom_buttom_widget.dart';
import 'package:round_7_mobile_cure_team4/features/doctor_details/presentation/widgets/doctor_card.dart';
import 'package:round_7_mobile_cure_team4/features/doctor_details/presentation/widgets/doctor_info_item.dart';
import 'package:round_7_mobile_cure_team4/features/doctor_details/presentation/widgets/doctor_review_card.dart';
import 'package:round_7_mobile_cure_team4/features/doctor_details/presentation/widgets/star_rating_widget.dart';

class DoctorDetailsPage extends StatefulWidget {
  final int id;
  const DoctorDetailsPage({super.key, required this.id});

  @override
  State<DoctorDetailsPage> createState() => _DoctorDetailsPageState();
}

class _DoctorDetailsPageState extends State<DoctorDetailsPage> {
  String? doctorUid;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<DoctorDetailsCubit>()
                ..getDoctorDetails(widget.id.toString()),
        ),
        BlocProvider(create: (_) => getIt<FavoriteCubit>()),
      ],
      child: Scaffold(
        appBar: CustomAppBarWidget(
          title: "Doctor Details",
          onBack: () => context.pop(),
          actions: [
            BlocProvider(
              create: (context) => getIt<ChatsCubit>(),
              child: BlocConsumer<ChatsCubit, ChatsCubitState>(
                listener: (context, state) {
                  if (state is ChatsCubitError) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.message)));
                  } else if (state is NewChat) {
                    context.push(AppRoutes.chatConversion, extra: state.chat);
                  }
                },
                builder: (context, state) {
                  return state is ChatsCubitLoading
                      ? const Center(child: CircularProgressIndicator())
                      : InkWell(
                          onTap: () {
                            if (doctorUid != null && doctorUid!.isNotEmpty) {
                              log("doctorUid: $doctorUid");
                              context.read<ChatsCubit>().createChat(
                                receiverId: doctorUid!,
                              );
                            }
                          },
                          child: SvgPicture.asset(SvgAssets.chat),
                        );
                },
              ),
            ),
          ],
        ),
        body: BlocBuilder<DoctorDetailsCubit, DoctorDetailsState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (doctorDetails, availableDates, availableTimesByDate) {
                final doctor = doctorDetails;
                doctorUid = doctor.userId;
                return SingleChildScrollView(
                  padding: EdgeInsets.all(12.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8.h),
                      DoctorCard(
                        doctorId: doctor.id,
                        name: doctor.fullName,
                        specialty: doctor.specialities.join(", "),
                        address: doctor.address,
                        imageUrl: doctor.imgUrl,
                        isFavorite: doctor.isFavourite,
                        onFavoriteTap: () {
                          context.read<FavoriteCubit>().makeFavorite(doctor.id);
                        },
                      ),

                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DoctorInfoItem(
                            icon: SvgAssets.profile2User,
                            value: "${doctor.bookingCount}+",
                            label: "Patients",
                          ),
                          DoctorInfoItem(
                            icon: SvgAssets.medal2,
                            value: "${doctor.experienceYears}",
                            label: "Experience",
                          ),
                          DoctorInfoItem(
                            icon: SvgAssets.blackStar,
                            value: "${doctor.rating}",
                            label: "Rating",
                          ),
                          DoctorInfoItem(
                            icon: SvgAssets.messages,
                            value: "${doctor.reviewsCount}+",
                            label: "Reviews",
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      Text("About me", style: RegularGeorgia.regularGeorgia18),
                      SizedBox(height: 6.h),
                      Text(
                        doctor.about,
                        style: RegularMontserrat.regularMontserrat14.copyWith(
                          color: AppColors.secondary200,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        "Reviews and Rating",
                        style: RegularGeorgia.regularGeorgia16,
                      ),
                      SizedBox(height: 10.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${doctor.rating}/5",
                              style: RegularGeorgia.regularGeorgia22,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                StarRating(rating: doctor.rating, size: 22.sp),
                                SizedBox(height: 4.h),
                                Text(
                                  "${doctor.reviewsCount}+ Reviews",
                                  style: RegularGeorgia.regularGeorgia18
                                      .copyWith(color: AppColors.secondary100),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.h),
                      doctor.reviews.isEmpty
                          ? Center(
                              child: SizedBox(
                                height: 250.h,
                                child: Lottie.asset(
                                  LottieImages.noResult,
                                  repeat: false,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            )
                          : ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: doctor.reviews.length,
                              itemBuilder: (context, index) {
                                final review = doctor.reviews[index];
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 12.h),
                                  child: DoctorReviewCard(review: review),
                                );
                              },
                            ),
                    ],
                  ),
                );
              },
              error: (message) => Center(child: Text(message)),
            );
          },
        ),
        bottomNavigationBar:
            BlocBuilder<DoctorDetailsCubit, DoctorDetailsState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () => const SizedBox.shrink(),
                  loaded:
                      (doctorDetails, availableDates, availableTimesByDate) {
                        final doctor = doctorDetails;
                        return Container(
                          height: 140.h,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                spreadRadius: 1,
                                blurRadius: 6,
                                offset: const Offset(0, -3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.w),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.w,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Price ',
                                              style: MediumMontserrat
                                                  .mediumMontserrat24,
                                            ),
                                            TextSpan(
                                              text: '/hour',
                                              style: RegularMontserrat
                                                  .regularMontserrat16
                                                  .copyWith(
                                                    color:
                                                        AppColors.secondary200,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        '${doctor.pricePerHour}\$',
                                        style: MediumMontserrat
                                            .mediumMontserrat18
                                            .copyWith(
                                              color: AppColors.error500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                SafeArea(
                                  bottom: true,
                                  child: CustomButtonWidget(
                                    text: "Book Appointment",
                                    onPressed: () {
                                      GoRouter.of(context).pushNamed(
                                        AppRoutes.bookAppointment,
                                        extra: {
                                          'doctor': doctor,
                                          'availableDates': availableDates,
                                          'availableTimesByDate':
                                              availableTimesByDate,
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                  error: (_) => const SizedBox.shrink(),
                );
              },
            ),
      ),
    );
  }
}
