import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';

class DoctorAvailabilityCalendar extends StatefulWidget {
  final Function(DateTime) onDaySelected;
  final List<String> availableDates;

  const DoctorAvailabilityCalendar({
    super.key,
    required this.onDaySelected,
    required this.availableDates,
  });

  @override
  State<DoctorAvailabilityCalendar> createState() =>
      _DoctorAvailabilityCalendarState();
}

class _DoctorAvailabilityCalendarState
    extends State<DoctorAvailabilityCalendar> {
  DateTime? _selectedDay;

  late final Set<DateTime> _availableDays = widget.availableDates
      .map((e) => DateTime.parse(e))
      .toSet();

  bool _isAvailable(DateTime day) {
    return _availableDays.any(
      (d) => d.year == day.year && d.month == day.month && d.day == day.day,
    );
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (_isAvailable(selectedDay)) {
      setState(() => _selectedDay = selectedDay);
      widget.onDaySelected(selectedDay);
    }
  }

  @override
  Widget build(BuildContext context) {
    final focusedDay =
        _selectedDay ??
        (_availableDays.isNotEmpty ? _availableDays.first : DateTime.now());

    return Center(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.all(12.w),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.secondary100.withOpacity(0.3),
              blurRadius: 10.r,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: TableCalendar(
          firstDay: DateTime.utc(DateTime.now().year - 1, 1, 1),
          lastDay: DateTime.utc(DateTime.now().year + 2, 12, 31),
          daysOfWeekHeight: 30.h,
          daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: MediumMontserrat.mediumMontserrat12.copyWith(
              color: AppColors.black,
            ),
            weekendStyle: MediumMontserrat.mediumMontserrat12.copyWith(
              color: AppColors.secondary100,
            ),
          ),
          focusedDay: focusedDay,
          rowHeight: 45.h,
          selectedDayPredicate: (day) =>
              _selectedDay != null &&
              day.year == _selectedDay!.year &&
              day.month == _selectedDay!.month &&
              day.day == _selectedDay!.day,
          onDaySelected: _onDaySelected,
          enabledDayPredicate: _isAvailable,
          calendarStyle: CalendarStyle(
            outsideDaysVisible: false,
            defaultDecoration: const BoxDecoration(),
            selectedDecoration: const BoxDecoration(),
            todayDecoration: const BoxDecoration(),
            weekendDecoration: const BoxDecoration(),
            holidayDecoration: const BoxDecoration(),
            markerDecoration: const BoxDecoration(),
          ),
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, day, focusedDay) {
              final available = _isAvailable(day);
              final isSelected =
                  _selectedDay != null &&
                  day.year == _selectedDay!.year &&
                  day.month == _selectedDay!.month &&
                  day.day == _selectedDay!.day;

              Color bgColor;
              Color textColor;

              if (isSelected) {
                bgColor = AppColors.primary500;
                textColor = AppColors.white;
              } else if (available) {
                bgColor = AppColors.white;
                textColor = AppColors.black;
              } else {
                bgColor = AppColors.neutral50;
                textColor = AppColors.secondary100;
              }

              return AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: EdgeInsets.all(5.w),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                alignment: Alignment.center,
                child: Text(
                  '${day.day}',
                  style: MediumMontserrat.mediumMontserrat14.copyWith(
                    color: textColor,
                  ),
                ),
              );
            },
            todayBuilder: (context, day, focusedDay) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: EdgeInsets.all(5.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primary500.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  '${day.day}',
                  style: MediumMontserrat.mediumMontserrat14.copyWith(
                    color: AppColors.white,
                  ),
                ),
              );
            },
          ),
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
          ),
        ),
      ),
    );
  }
}
