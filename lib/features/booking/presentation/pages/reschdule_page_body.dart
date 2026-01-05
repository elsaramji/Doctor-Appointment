import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:round_7_mobile_cure_team4/core/di/di.dart';
import 'package:round_7_mobile_cure_team4/core/helper/assets.dart';
import 'package:round_7_mobile_cure_team4/core/helper/api_constants.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';
import 'package:round_7_mobile_cure_team4/features/book_appointment/presentation/widgets/doctor_availability_calender.dart';
import 'package:round_7_mobile_cure_team4/features/booking/domain/entities/booking_entity.dart';
import 'package:round_7_mobile_cure_team4/features/booking/presentation/cubit/cancel_cubit/cancel_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/booking/presentation/cubit/cancel_cubit/cancel_state.dart';
import 'package:round_7_mobile_cure_team4/features/booking/presentation/cubit/reschedule_cubit/reschedule_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/booking/presentation/cubit/reschedule_cubit/reschedule_state.dart';
import 'package:round_7_mobile_cure_team4/features/doctor_details/presentation/widgets/custom_app_bar_widget.dart';

class ReschedulePageBody extends StatefulWidget {
  final BookingEntity doctor;
  final List<String> availableDates;
  final Map<String, List<String>> availableTimesByDate;

  const ReschedulePageBody({
    super.key,
    required this.doctor,
    required this.availableDates,
    required this.availableTimesByDate,
  });

  @override
  State<ReschedulePageBody> createState() => _ReschedulePageBodyState();
}

class _ReschedulePageBodyState extends State<ReschedulePageBody> {
  bool isCalendarVisible = false;
  DateTime? selectedDay;
  String? selectedDateStr;
  int selectedTimeIndex = -1;
  String? selectedTime;

  void _onDaySelected(DateTime day) {
    setState(() {
      selectedDay = day;
      selectedDateStr = DateFormat('yyyy-MM-dd').format(day);
      selectedTimeIndex = -1;
      selectedTime = null;
      isCalendarVisible = false;
    });
  }

  void _showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final timesForSelectedDay = selectedDateStr != null
        ? widget.availableTimesByDate[selectedDateStr!] ?? []
        : [];

    return BlocListener<RescheduleCubit, RescheduleState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          rescheduleLoading: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Dialog(
                backgroundColor: Colors.transparent,
                elevation: 0,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          },
          rescheduleSuccess: (response) {
            Navigator.of(context).pop(); // Close loading dialog
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(response.message),
                backgroundColor: AppColors.success500,
              ),
            );
            // Navigate back to My Booking page
            Navigator.of(context).pop();
          },
          rescheduleError: (message) {
            Navigator.of(context).pop(); // Close loading dialog
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: AppColors.error500,
              ),
            );
          },
        );
      },
      child: Scaffold(
      appBar: CustomAppBarWidget(title: "Your Appointment"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Warning Card
            Container(
              padding: EdgeInsets.all(10.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.warning50,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(SvgAssets.errorIcon),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Text(
                      "Cancellation must be made at least 24 hours in advance to receive a refund",
                      style: MediumMontserrat.mediumMontserrat14.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.warning500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.h),
            // Doctor Card
            Card(
              color: AppColors.white,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
              child: Padding(
                padding: EdgeInsets.all(12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(SvgAssets.calendar, color: AppColors.black),
                        SizedBox(width: 6.w),
                        Text(
                          selectedDay != null
                              ? DateFormat('EEEE, MMMM d').format(selectedDay!)
                              : DateFormat('EEEE, MMMM d')
                              .format(DateTime.parse(widget.doctor.appointmentAt)),
                          style: MediumMontserrat.mediumMontserrat12.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "Upcoming",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.primaryDefault,
                          ),
                        ),
                      ],
                    ),
                    Divider(color: AppColors.secondary50),
                    Row(
                      children: [
                        ClipOval(
                          child: widget.doctor.doctorImageUrl != null
                              ? Image.network(
                                  "${ApiConstant.baseUrl}${widget.doctor.doctorImageUrl}",
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
                            Text(widget.doctor.doctorName,
                                style: RegularGeorgia.regularGeorgia18),
                            SizedBox(height: 6.h),
                            Text(
                              widget.doctor.doctorSpeciality,
                              style: MediumMontserrat.mediumMontserrat14.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.secondary200,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        SvgPicture.asset(SvgAssets.chat),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            // Select Day Button
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                onPressed: () => setState(() => isCalendarVisible = !isCalendarVisible),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: AppColors.primary500),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(SvgAssets.calendar),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Text(
                        selectedDay != null
                            ? DateFormat('EEEE, MMMM d').format(selectedDay!)
                            : "Select Day",
                        style: MediumMontserrat.mediumMontserrat16.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    AnimatedRotation(
                      turns: isCalendarVisible ? 0.5 : 0,
                      duration: const Duration(milliseconds: 250),
                      child: SvgPicture.asset(SvgAssets.arrowDown),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: isCalendarVisible
                  ? Column(
                key: const ValueKey("calendar"),
                children: [
                  SizedBox(height: 10.h),
                  DoctorAvailabilityCalendar(
                    availableDates: widget.availableDates,
                    onDaySelected: _onDaySelected,
                  ),
                ],
              )
                  : const SizedBox.shrink(key: ValueKey("spacer")),
            ),
            SizedBox(height: 20.h),
            Text("Select the time", style: RegularGeorgia.regularGeorgia18),
            SizedBox(height: 12.h),
            timesForSelectedDay.isEmpty
                ? Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Text(
                  selectedDateStr == null
                      ? "Please select a day first"
                      : "No available times for selected day",
                  style: MediumMontserrat.mediumMontserrat14.copyWith(
                    color: AppColors.secondary200,
                  ),
                ),
              ),
            )
                : GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 2.5,
                crossAxisSpacing: 15.w,
                mainAxisSpacing: 15.h,
                crossAxisCount: 3,
              ),
              itemCount: timesForSelectedDay.length,
              itemBuilder: (context, index) {
                final time = timesForSelectedDay[index];
                return InkWell(
                  onTap: () => setState(() {
                    selectedTimeIndex = index;
                    selectedTime = time;
                  }),
                  child: Container(
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: selectedTimeIndex == index
                          ? AppColors.primary500
                          : AppColors.neutral50,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Center(
                      child: Text(
                        time,
                        style: MediumMontserrat.mediumMontserrat16.copyWith(
                          color: selectedTimeIndex == index
                              ? AppColors.white
                              : AppColors.neutral700,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: 150.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Reschedule Button
              ElevatedButton(
                onPressed: () {
                  if (selectedDateStr != null && selectedTime != null) {
                    final sanitizedDate =
                    selectedDateStr!.replaceAll(RegExp(r'[^0-9\-]'), '');
                    final sanitizedTime =
                    selectedTime!.replaceAll(RegExp(r'[^0-9:]'), '');
                    final newDateTimeString =
                        "${sanitizedDate}T$sanitizedTime:00";

                    context.read<RescheduleCubit>().rescheduleBooking(
                        bookingId: widget.doctor.id.toString(),
                        newDateTimeString: newDateTimeString);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please select day and time")),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryDefault,
                  foregroundColor: AppColors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  fixedSize: Size(350.w, 45.h),
                ),
                child: const Text("Reschedule"),
              ),
              SizedBox(height: 15.h),
              // Cancel Button with CancelBookingCubit
              ElevatedButton(
                onPressed: () {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return BlocProvider(
                        create: (_) => getIt<CancelBookingCubit>(),
                        child: BlocConsumer<CancelBookingCubit, CancelState>(
                          listener: (context, state) {
                            state.when(
                              initial: () {},
                              cancelLoading: () => _showLoadingDialog(),
                              cancelSuccess: (data) {
                                Navigator.of(context).pop(); // close loading
                                Navigator.of(context).pop(); // close dialog
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(data.message)));
                                Navigator.pop(context); // go back after cancel
                              },
                              cancelError: (message) {
                                Navigator.of(context).pop(); // close loading
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(message)));
                              },
                            );
                          },
                          builder: (context, state) {
                            return AlertDialog(
                              backgroundColor: AppColors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.r)),
                              contentPadding: EdgeInsets.all(20.w),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(SvgAssets.errorImage, height: 120.h),
                                  SizedBox(height: 15.h),
                                  Text(
                                    "Warning!",
                                    style: MediumMontserrat.mediumMontserrat20.copyWith(
                                        color: AppColors.warning500,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    "Cancellation must be made at least 24 hours in advance to receive a refund",
                                    style: MediumMontserrat.mediumMontserrat16.copyWith(
                                        color: AppColors.secondary100),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 20.h),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () => Navigator.of(context).pop(),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColors.white,
                                            foregroundColor: AppColors.secondary100,
                                            side: BorderSide(
                                                color: AppColors.secondary100, width: 1),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(30.r),
                                            ),
                                            fixedSize: Size.fromHeight(45.h),
                                          ),
                                          child: Text(
                                            "No, Don't Cancel",
                                            style: MediumMontserrat.mediumMontserrat16
                                                .copyWith(color: AppColors.secondary100),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            context
                                                .read<CancelBookingCubit>()
                                                .cancelBooking(
                                                bookingId: widget.doctor.id.toString());
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColors.secondary500,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(30.r),
                                            ),
                                            fixedSize: Size.fromHeight(45.h),
                                          ),
                                          child: Text(
                                            "Yes, Cancel",
                                            style: MediumMontserrat.mediumMontserrat16
                                                .copyWith(color: AppColors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.white,
                  foregroundColor: AppColors.secondary100,
                  side: BorderSide(color: AppColors.secondary100, width: 1),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  fixedSize: Size(350.w, 45.h),
                ),
                child: const Text("Cancel"),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
        ),
      ),
    );
  }
}
