import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:round_7_mobile_cure_team4/core/di/di.dart';
import 'package:round_7_mobile_cure_team4/core/helper/assets.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/shared_widget/booKing_bottom_bar_widget.dart';
import 'package:round_7_mobile_cure_team4/features/doctor_details/domain/entities/doctor_details_entity.dart';
import 'package:round_7_mobile_cure_team4/features/doctor_details/presentation/widgets/custom_app_bar_widget.dart';
import 'package:round_7_mobile_cure_team4/features/pay/presentation/cubit/pay_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/pay/presentation/cubit/pay_state.dart';
import 'package:round_7_mobile_cure_team4/features/pay/presentation/pages/payment_web.dart';
import 'package:round_7_mobile_cure_team4/features/pay/presentation/widgets/add_new_card_buttom.dart';
import 'package:round_7_mobile_cure_team4/features/pay/domain/entities/payment_method_model.dart';
import 'package:round_7_mobile_cure_team4/core/routes/app_router.dart';

class PayPage extends StatefulWidget {
  final String date;
  final String displayDate;
  final String time;
  final DoctorDetailsEntity doctor;
  final int slotId;

  const PayPage({
    super.key,
    required this.date,
    required this.displayDate,
    required this.time,
    required this.doctor,
    required this.slotId,
  });

  @override
  State<PayPage> createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
  int? selectedPaymentIndex;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PaymentCubit>(),
      child: BlocConsumer<PaymentCubit, PaymentState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (response) {
              if (response.paymentUrl.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentWebViewPage(
                      url: response.paymentUrl,
                      onPaymentSuccess: () {
                        Navigator.of(
                          context,
                        ).popUntil((route) => route.isFirst);
                        GoRouter.of(context).go(AppRoutes.home);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Payment completed successfully!"),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                    ),
                  ),
                );
              } else {
                if (response.success ||
                    response.status.toLowerCase().contains('success')) {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  GoRouter.of(context).go(AppRoutes.home);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Payment completed successfully!"),
                      backgroundColor: Colors.green,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(response.status)));
                }
              }
            },
            error: (message) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(message)));
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBarWidget(title: "Book Appointment"),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Doctor info
                  Text(
                    widget.doctor.fullName ?? "",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  SizedBox(height: 20.h),

                  // Appointment info
                  Row(
                    children: [
                      SvgPicture.asset(
                        SvgAssets.calendar,
                        width: 20.w,
                        height: 20.h,
                        color: AppColors.primaryDefault,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "${widget.displayDate} at ${widget.time}",
                        style: TextStyle(fontSize: 12.sp),
                      ),
                      const Spacer(),
                      Text(
                        "Reschedule",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.primaryDefault,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),

                  // Test Card Info
                  Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: AppColors.primary500.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: AppColors.primary500.withOpacity(0.3),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: AppColors.primary500,
                              size: 20.sp,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              "Test Card Numbers",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "Visa: 4111 1111 1111 1111",
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "Mastercard: 5555 5555 5555 4444",
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "CVV: Any 3 digits | Expiry: Any future date",
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: AppColors.secondary200,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // Payment method title
                  Text("Payment Method", style: TextStyle(fontSize: 18.sp)),
                  SizedBox(height: 16.h),

                  // Payment list
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        ...List.generate(mockPaymentMethod.length, (index) {
                          final card = mockPaymentMethod[index];
                          final isSelected = selectedPaymentIndex == index;

                          return GestureDetector(
                            onTap: () {
                              setState(() => selectedPaymentIndex = index);
                              final cubit = context.read<PaymentCubit>();

                              if (widget.doctor.availableSlots.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("No available slots found"),
                                  ),
                                );
                                return;
                              }

                              try {
                                final slotId = widget.slotId;
                                if (slotId == 0) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Slot ID not found"),
                                    ),
                                  );
                                  return;
                                }

                                final appointmentAt =
                                    "${widget.date}T${widget.time}:00";

                                switch (card.title) {
                                  case "visa":
                                    cubit.payWithVisa(
                                      doctor: widget.doctor,
                                      slotId: slotId,
                                      appointmentAt: appointmentAt,
                                    );
                                    break;
                                  case "cash":
                                    cubit.payWithCash(
                                      doctor: widget.doctor,
                                      slotId: slotId,
                                      appointmentAt: appointmentAt,
                                    );
                                    break;
                                  default:
                                    cubit.payWithPayPal(
                                      doctor: widget.doctor,
                                      slotId: slotId,
                                      appointmentAt: appointmentAt,
                                    );
                                }
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "Could not find matching slot: ${e.toString()}",
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Container(
                              height: 60.h,
                              margin: EdgeInsets.only(bottom: 10.h),
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 10.h,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: isSelected
                                    ? AppColors.success50
                                    : AppColors.white,
                              ),
                              child: Row(
                                children: [
                                  isSelected
                                      ? Icon(
                                          Icons.check_circle,
                                          color: AppColors.success500,
                                        )
                                      : Container(
                                          width: 20.w,
                                          height: 20.h,
                                          decoration: BoxDecoration(
                                            color: AppColors.white,
                                            border: Border.all(
                                              color: AppColors.secondary100,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              10.r,
                                            ),
                                          ),
                                        ),
                                  SizedBox(width: 10.w),
                                  Text(
                                    card.title,
                                    style: TextStyle(fontSize: 14.sp),
                                  ),
                                  const Spacer(),
                                  SvgPicture.asset(card.image, width: 35.w),
                                ],
                              ),
                            ),
                          );
                        }),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h, bottom: 20.h),
                          child: AddNewCardButton(onTap: () {}),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Bottom bar
            bottomNavigationBar: state.when(
              initial: () => BookingBottomBar(
                title: "Pay",
                onContinue: () {},
                price: widget.doctor.pricePerHour ?? 0,
              ),
              loading: () => BookingBottomBar(
                title: "Processing...",
                onContinue: () {},
                price: widget.doctor.pricePerHour ?? 0,
              ),
              success: (response) => BookingBottomBar(
                title: "Pay",
                onContinue: () {},
                price: widget.doctor.pricePerHour ?? 0,
              ),
              error: (message) => BookingBottomBar(
                title: "Pay",
                onContinue: () {},
                price: widget.doctor.pricePerHour ?? 0,
              ),
            ),
          );
        },
      ),
    );
  }
}
