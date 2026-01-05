import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import 'package:round_7_mobile_cure_team4/core/helper/assets.dart';
import 'package:round_7_mobile_cure_team4/core/routes/app_router.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';
import 'package:round_7_mobile_cure_team4/features/book_appointment/presentation/widgets/doctor_availability_calender.dart';
import 'package:round_7_mobile_cure_team4/features/doctor_details/domain/entities/doctor_details_entity.dart';
import 'package:round_7_mobile_cure_team4/features/doctor_details/presentation/widgets/doctor_card.dart';
import 'package:round_7_mobile_cure_team4/features/widgets/booking_bottom_bar_widget.dart';
import 'package:round_7_mobile_cure_team4/features/profile/presentation/widgets/custom_appbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:round_7_mobile_cure_team4/core/di/di.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/cubit/favorite/favorite_cubit.dart';

class BookAppointmentPage extends StatefulWidget {
  final DoctorDetailsEntity doctor;
  final List<String> availableDates;
  final Map<String, List<Map<String, dynamic>>> availableTimesByDate;

  const BookAppointmentPage({
    super.key,
    required this.doctor,
    required this.availableDates,
    required this.availableTimesByDate,
  });

  @override
  State<BookAppointmentPage> createState() => _BookAppointmentPageState();
}

class _BookAppointmentPageState extends State<BookAppointmentPage> {
  DateTime? selectedDay;
  int? selectedTimeIndex;
  String? selectedTime;
  int? selectedSlotId;
  bool isCalendarVisible = false;

  void _onDaySelected(DateTime day) {
    setState(() {
      selectedDay = day;
      selectedTimeIndex = null;
      selectedTime = null;
      selectedSlotId = null;
      isCalendarVisible = false;
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.availableDates.isNotEmpty) {
      final firstDay = DateTime.parse(widget.availableDates.first);
      selectedDay = firstDay;
    }
  }

  @override
  Widget build(BuildContext context) {
    final timeSlotsForSelectedDay = selectedDay != null
        ? widget.availableTimesByDate[DateFormat('yyyy-MM-dd').format(selectedDay!)] ?? []
        : [];

    return BlocProvider(
      create: (_) => getIt<FavoriteCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Book Appointment",
          onBack: () => context.pop(),
        ),
        body: Padding(
          padding: EdgeInsets.all(12.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Builder(
                  builder: (context) {
                    return DoctorCard(
                      doctorId: widget.doctor.id,
                      name: widget.doctor.fullName,
                      specialty: widget.doctor.specialities.join(", "),
                      address: widget.doctor.address,
                      imageUrl: widget.doctor.imgUrl,
                      isFavorite: widget.doctor.isFavourite,
                      onFavoriteTap: () {
                        context.read<FavoriteCubit>().makeFavorite(widget.doctor.id);
                      },
                    );
                  }
                ),
                SizedBox(height: 20.h),
                Text("Select a day", style: RegularGeorgia.regularGeorgia18),
                SizedBox(height: 12.h),
                SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() => isCalendarVisible = !isCalendarVisible);
                    },
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
                            style: TextStyle(fontSize: 16.sp, color: AppColors.black),
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
                      : const SizedBox.shrink(),
                ),
                SizedBox(height: 20.h),
                Text("Select the time", style: RegularGeorgia.regularGeorgia18),
                SizedBox(height: 12.h),
                timeSlotsForSelectedDay.isEmpty
                    ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Center(
                    child: Text(
                      selectedDay == null
                          ? "Please select a day first"
                          : "No available times for selected day",
                      style: RegularMontserrat.regularMontserrat14.copyWith(
                        color: AppColors.secondary200,
                      ),
                    ),
                  ),
                )
                    : GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 15.w,
                    mainAxisSpacing: 15.h,
                    childAspectRatio: 2.5,
                  ),
                  itemCount: timeSlotsForSelectedDay.length,
                  itemBuilder: (context, index) {
                    final slot = timeSlotsForSelectedDay[index];
                    final time = slot['time'];
                    final slotId = slot['slotId'];

                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedTimeIndex = index;
                          selectedTime = time;
                          selectedSlotId = slotId;
                        });
                      },
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
        ),
        bottomNavigationBar: BookingBottomBar(
          price: widget.doctor.pricePerHour,
          titel: "Continue to Pay",
          onContinue: () {
            if (selectedDay != null && selectedTime != null && selectedSlotId != null) {
              final isoDate = DateFormat('yyyy-MM-dd').format(selectedDay!);
              final displayDate = DateFormat('EEEE, MMMM d').format(selectedDay!);
              context.pushNamed(
                AppRoutes.pay,
                extra: {
                  'doctor': widget.doctor,
                  'date': isoDate,
                  'displayDate': displayDate,
                  'time': selectedTime!,
                  'slotId': selectedSlotId!,
                },
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Please select a day and time")),
              );
            }
          },
        ),
      ),
    );
  }
}