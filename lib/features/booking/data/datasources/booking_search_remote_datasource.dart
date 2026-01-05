import 'package:round_7_mobile_cure_team4/features/booking/data/models/booking_search/booking_search_model.dart';
import 'package:round_7_mobile_cure_team4/features/booking/data/models/reschedule/reschedule_model.dart';

abstract class BookingSearchRemoteDataSource {
  Future<List<BookingSearchModel>> searchBookings(String fromDate);

  Future<RescheduleResponse> rescheduleBooking({
    required String id,
    required String date,
  });

  Future<RescheduleResponse> cancelBooking({required String id});
}
