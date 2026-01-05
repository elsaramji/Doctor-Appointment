import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';

class DoctorAvailabilityCalendarHorizontal extends StatefulWidget {
  final Function(DateTime) onDaySelected;
  final DateTime selectedDay;
  final List<DateTime>? bookedDays;

  const DoctorAvailabilityCalendarHorizontal({
    super.key,
    required this.onDaySelected,
    required this.selectedDay,
    this.bookedDays,
  });

  @override
  State<DoctorAvailabilityCalendarHorizontal> createState() =>
      _DoctorAvailabilityCalendarHorizontalState();
}

class _DoctorAvailabilityCalendarHorizontalState
    extends State<DoctorAvailabilityCalendarHorizontal> {
  final DateTime startAvailable = DateTime(2025, 11, 1);
  final DateTime endAvailable = DateTime(2025, 11, 30);

  @override
  Widget build(BuildContext context) {
    List<DateTime> days = [];
    for (int i = 0;
    i <= endAvailable.difference(startAvailable).inDays;
    i++) {
      days.add(startAvailable.add(Duration(days: i)));
    }

    return SizedBox(
      height: 90.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 13.h),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: days.length,
          itemBuilder: (context, index) {
            DateTime day = days[index];
            bool isSelected = _isSameDay(widget.selectedDay, day);
            bool hasBooking = widget.bookedDays != null &&
                widget.bookedDays!.any((d) => _isSameDay(d, day));

            Color bgColor;
            Color textColor;

            if (isSelected) {
              bgColor = AppColors.primaryDefault;
              textColor = AppColors.white;
            } else if (hasBooking) {
              bgColor = AppColors.secondary100;
              textColor = AppColors.black;
            } else {
              bgColor = AppColors.secondary50;
              textColor = AppColors.secondary200;
            }

            return GestureDetector(
              onTap: () => widget.onDaySelected(day),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                width: 50.w,
                height: 60.h,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
                      [day.weekday % 7],
                      style: MediumMontserrat.mediumMontserrat12.copyWith(
                        color: textColor,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '${day.day}',
                      style: MediumMontserrat.mediumMontserrat14.copyWith(
                        color: textColor,
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

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
