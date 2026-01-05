import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/booking/data/api_call/booking_search_api_call.dart';
import 'package:round_7_mobile_cure_team4/features/booking/data/datasources/booking_search_remote_datasource.dart';
import 'package:round_7_mobile_cure_team4/features/booking/data/models/booking_search/booking_search_model.dart';
import 'package:round_7_mobile_cure_team4/features/booking/data/models/reschedule/reschedule_model.dart';

@LazySingleton(as: BookingSearchRemoteDataSource)
class BookingSearchRemoteDataSourceImpl
    implements BookingSearchRemoteDataSource {
  final BookingSearchApiCall _bookingSearchApiCall;

  const BookingSearchRemoteDataSourceImpl(this._bookingSearchApiCall);

  @override
  Future<List<BookingSearchModel>> searchBookings(String fromDate) async {
    try {
      final result = await _bookingSearchApiCall.apiCall(fromDate);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RescheduleResponse> rescheduleBooking({
    required String id,
    required String date,
  }) async {
    try {
      final response = await _bookingSearchApiCall.apiCallReschedule(
        id: id,
        newDateTime: date,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RescheduleResponse> cancelBooking({required String id}) async {
    try {
      final response = await _bookingSearchApiCall.apiCallCancel(id: id);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
