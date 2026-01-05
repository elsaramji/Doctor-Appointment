import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:round_7_mobile_cure_team4/core/di/di.dart';
import 'package:round_7_mobile_cure_team4/features/booking/domain/entities/booking_entity.dart';
import 'package:round_7_mobile_cure_team4/features/booking/presentation/cubit/reschedule_cubit/reschedule_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/booking/presentation/pages/reschdule_page_body.dart';
import 'package:round_7_mobile_cure_team4/features/doctor_details/presentation/widgets/custom_app_bar_widget.dart';

class ReschedulePage extends StatefulWidget {
  final BookingEntity doctor;

  const ReschedulePage({super.key, required this.doctor});

  @override
  State<ReschedulePage> createState() => _ReschedulePageState();
}

class _ReschedulePageState extends State<ReschedulePage> {
  late Future<Map<String, dynamic>> _futureData;

  @override
  void initState() {
    super.initState();
    _futureData = fetchAvailableDatesAndTimes();
  }

  Future<Map<String, dynamic>> fetchAvailableDatesAndTimes() async {
    await Future.delayed(const Duration(seconds: 1));

    final currentBookingDate = DateTime.parse(widget.doctor.appointmentAt);

    final futureDates = List.generate(3, (index) {
      final date = currentBookingDate.add(Duration(days: index + 1));
      return date.toIso8601String().split('T').first;
    });

    final Map<String, List<String>> timesByDate = {
      for (var date in futureDates) date: ["09:00", "10:00", "11:30"]
    };

    return {
      "availableDates": futureDates,
      "availableTimesByDate": timesByDate,
    };
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: _futureData,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Scaffold(
            appBar: CustomAppBarWidget(title: "Your Appointment"),
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            appBar: CustomAppBarWidget(title: "Your Appointment"),
            body: Center(child: Text("Error loading data: ${snapshot.error}")),
          );
        }

        final availableDates = snapshot.data!["availableDates"] as List<String>;
        final availableTimesByDate =
            snapshot.data!["availableTimesByDate"] as Map<String, List<String>>;

        return BlocProvider(
          create: (_) => getIt<RescheduleCubit>(),
          child: ReschedulePageBody(
            doctor: widget.doctor,
            availableDates: availableDates,
            availableTimesByDate: availableTimesByDate,
          ),
        );
      },
    );
  }
}
