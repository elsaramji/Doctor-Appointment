import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:round_7_mobile_cure_team4/core/di/di.dart';
import 'package:round_7_mobile_cure_team4/core/helper/assets.dart';
import 'package:round_7_mobile_cure_team4/core/helper/api_constants.dart';
import 'package:round_7_mobile_cure_team4/core/routes/app_router.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';
import 'package:round_7_mobile_cure_team4/features/booking/domain/entities/booking_entity.dart';
import 'package:round_7_mobile_cure_team4/features/booking/presentation/cubit/booking_cubit/booking_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/booking/presentation/cubit/cancel_cubit/cancel_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/booking/presentation/cubit/cancel_cubit/cancel_state.dart';
import 'package:round_7_mobile_cure_team4/features/booking/presentation/widgets/card_custom_bottom.dart';

class BookingCard extends StatelessWidget {
  final BookingEntity booking;
  final String formattedDate;
  final String formattedTime;

  const BookingCard({
    super.key,
    required this.booking,
    required this.formattedDate,
    required this.formattedTime,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    switch (booking.status) {
      case "Upcoming":
        statusColor = AppColors.primaryDefault;
        break;
      case "Completed":
        statusColor = AppColors.success500;
        break;
      case "Canceled":
        statusColor = AppColors.error500;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Card(
      color: AppColors.white,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date & status
            Row(
              children: [
                SvgPicture.string(SvgAssets.calendar, color: AppColors.black),
                SizedBox(width: 6.w),
                Text(
                  formattedDate,
                  style: MediumMontserrat.mediumMontserrat12.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(width: 6.w),
                Text(
                  "- $formattedTime",
                  style: MediumMontserrat.mediumMontserrat12.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
                Spacer(),
                Text(
                  booking.status,
                  style: MediumMontserrat.mediumMontserrat12.copyWith(
                    color: statusColor,
                  ),
                ),
              ],
            ),

            Divider(color: AppColors.secondary50),

            // Doctor info
            Row(
              children: [
                ClipOval(
                  child: booking.doctorImageUrl != null
                      ? Image.network(
                          "${ApiConstant.baseUrl}${booking.doctorImageUrl}",
                          width: 60.r,
                          height: 60.r,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 60.r,
                              height: 60.r,
                              color: AppColors.secondary50,
                              child: Icon(
                                Icons.broken_image_outlined,
                                color: AppColors.secondary200,
                                size: 30.sp,
                              ),
                            );
                          },
                        )
                      : Image.asset(
                          ImageAssets.fakeDoctorImage,
                          width: 60.r,
                          height: 60.r,
                          fit: BoxFit.cover,
                        ),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      booking.doctorName,
                      style: RegularGeorgia.regularGeorgia18,
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      booking.doctorSpeciality,
                      style: MediumMontserrat.mediumMontserrat14.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.secondary200,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 8.h),

            // Buttons
            Row(
              children: [
                if (booking.status == "Upcoming") ...[
                  Expanded(
                    child: BlocProvider(
                      create: (_) => getIt<CancelBookingCubit>(),
                      child: BlocConsumer<CancelBookingCubit, CancelState>(
                        listener: (context, state) {
                          state.when(
                            initial: () {},
                            cancelLoading: () => showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (_) => Dialog(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            ),
                            cancelSuccess: (data) {
                              context.pop(); // close loading
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(data.message)),
                              );
                              context.read<BookingCubit>().searchBookings(
                                DateTime.now(),
                              );

                              // Navigate to bookings after success
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                context.go(AppRoutes.myBooking);
                              });
                            },
                            cancelError: (message) {
                              context.pop(); // close loading
                              ScaffoldMessenger.of(
                                context,
                              ).showSnackBar(SnackBar(content: Text(message)));
                            },
                          );
                        },
                        builder: (context, state) {
                          return CardCustomButton(
                            text: "Cancel",
                            backgroundColor: AppColors.white,
                            foregroundColor: AppColors.secondary100,
                            borderColor: AppColors.secondary100,
                            onPressed: () {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (_) => AlertDialog(
                                  backgroundColor: AppColors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  contentPadding: EdgeInsets.all(20.w),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                        SvgAssets.errorImage,
                                        height: 120.h,
                                      ),
                                      SizedBox(height: 15.h),
                                      Text(
                                        "Warning!",
                                        style: MediumMontserrat
                                            .mediumMontserrat20
                                            .copyWith(
                                              color: AppColors.warning500,
                                              fontWeight: FontWeight.w700,
                                            ),
                                      ),
                                      SizedBox(height: 10.h),
                                      Text(
                                        "Cancellation must be made at least 24 hours in advance to receive a refund",
                                        style: MediumMontserrat
                                            .mediumMontserrat16
                                            .copyWith(
                                              color: AppColors.secondary100,
                                            ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 20.h),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: ElevatedButton(
                                              onPressed: () {
                                                context.pop();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    AppColors.white,
                                                foregroundColor:
                                                    AppColors.secondary100,
                                                side: BorderSide(
                                                  color: AppColors.secondary100,
                                                  width: 1,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        30.r,
                                                      ),
                                                ),
                                                fixedSize: Size.fromHeight(
                                                  45.h,
                                                ),
                                              ),
                                              child: Text(
                                                "No, Don't Cancel",
                                                style: MediumMontserrat
                                                    .mediumMontserrat16
                                                    .copyWith(
                                                      color: AppColors
                                                          .secondary100,
                                                    ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10.w),
                                          Expanded(
                                            child: ElevatedButton(
                                              onPressed: () {
                                                context.pop();
                                                context
                                                    .read<CancelBookingCubit>()
                                                    .cancelBooking(
                                                      bookingId: booking.id
                                                          .toString(),
                                                    );
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    AppColors.secondary500,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        30.r,
                                                      ),
                                                ),
                                                fixedSize: Size.fromHeight(
                                                  45.h,
                                                ),
                                              ),
                                              child: Text(
                                                "Yes, Cancel",
                                                style: MediumMontserrat
                                                    .mediumMontserrat16
                                                    .copyWith(
                                                      color: AppColors.white,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: CardCustomButton(
                      text: "Reschedule",
                      backgroundColor: AppColors.primaryDefault,
                      foregroundColor: AppColors.white,
                      onPressed: () {
                        GoRouter.of(context).pushNamed(
                          AppRoutes.reschedulePage,
                          extra: {
                            'booking': booking,
                            'currentBookingDate': booking
                                .appointmentAt,
                          },
                        );
                      },
                    ),
                  ),
                ],
                // Completed and Canceled buttons unchanged
                if (booking.status == "Completed") ...[
                  Expanded(
                    child: CardCustomButton(
                      text: "View details",
                      backgroundColor: AppColors.white,
                      foregroundColor: AppColors.primaryDefault,
                      borderColor: AppColors.primaryDefault,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: CardCustomButton(
                      text: "Feedback",
                      backgroundColor: AppColors.primaryDefault,
                      foregroundColor: AppColors.white,
                      onPressed: () {},
                    ),
                  ),
                ],
                if (booking.status == "Canceled") ...[
                  Expanded(
                    child: CardCustomButton(
                      text: "Book again",
                      backgroundColor: AppColors.white,
                      foregroundColor: AppColors.primaryDefault,
                      borderColor: AppColors.primaryDefault,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: CardCustomButton(
                      text: "Support",
                      backgroundColor: AppColors.primaryDefault,
                      foregroundColor: AppColors.white,
                      onPressed: () {},
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
