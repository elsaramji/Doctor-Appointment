import 'package:round_7_mobile_cure_team4/features/booking/domain/entities/booking_entity.dart';
import 'package:round_7_mobile_cure_team4/features/booking/domain/entities/reschedule_entity.dart';

abstract class BookingRepo {
  Future<List<BookingEntity>> searchBookings(String fromDate);

  Future<RescheduleResponseEntity> rescheduleBooking({
    required String id,
    required String newDateTime,
  });
  Future<RescheduleResponseEntity> cancelBooking({
    required String id,
  });

}
