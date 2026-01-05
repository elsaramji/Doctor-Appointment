import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';
import 'package:round_7_mobile_cure_team4/features/booking/presentation/cubit/booking_cubit/booking_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/booking/presentation/cubit/booking_cubit/booking_state.dart';
import 'package:round_7_mobile_cure_team4/features/booking/presentation/widgets/booking_card.dart';
import 'package:round_7_mobile_cure_team4/features/booking/presentation/widgets/horizontal_calendar.dart';

class MyBookingPage extends StatefulWidget {
  const MyBookingPage({super.key});

  @override
  State<MyBookingPage> createState() => _MyBookingPageState();
}

class _MyBookingPageState extends State<MyBookingPage> {
  DateTime selectedDay = DateTime.now();

  String _formatDate(DateTime date) =>
      DateFormat('EEEE, MMMM d').format(date);

  String _formatTime(String isoString) {
    try {
      return DateFormat('h:mm a').format(DateTime.parse(isoString));
    } catch (_) {
      return isoString;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BookingCubit>().searchBookings(selectedDay);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Booking", style: RegularGeorgia.regularGeorgia20),
      ),
      body: Column(
        children: [
          // Calendar
          DoctorAvailabilityCalendarHorizontal(
            selectedDay: selectedDay,
            onDaySelected: (day) {
              setState(() => selectedDay = day);
              context.read<BookingCubit>().searchBookings(day);
            },
          ),

          // Bookings list
          Expanded(
            child: BlocBuilder<BookingCubit, BookingState>(
              builder: (context, state) {
                return state.when(
                  initial: () =>
                  const Center(child: CircularProgressIndicator()),
                  loading: () =>
                  const Center(child: CircularProgressIndicator()),
                  loaded: (bookings) {
                    if (bookings.isEmpty) {
                      return Center(
                        child: Text(
                          "No bookings for this day",
                          style: RegularMontserrat.regularMontserrat16
                              .copyWith(color: AppColors.secondary200),
                        ),
                      );
                    }
                    return ListView.builder(
                      padding: EdgeInsets.all(12.w),
                      itemCount: bookings.length,
                      itemBuilder: (context, index) {
                        final booking = bookings[index];
                        return BookingCard(
                          booking: booking,
                          formattedDate: _formatDate(selectedDay),
                          formattedTime: _formatTime(booking.appointmentAt),
                        );
                      },
                    );
                  },
                  error: (message) => Center(
                    child: Text(
                      message,
                      style: RegularMontserrat.regularMontserrat16
                          .copyWith(color: AppColors.error500),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
