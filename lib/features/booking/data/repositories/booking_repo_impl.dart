import 'dart:developer';
import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/booking/data/datasources/booking_search_remote_datasource.dart';
import 'package:round_7_mobile_cure_team4/features/booking/data/models/booking_search/booking_search_model.dart';
import 'package:round_7_mobile_cure_team4/features/booking/data/models/reschedule/reschedule_model.dart';
import 'package:round_7_mobile_cure_team4/features/booking/domain/entities/booking_entity.dart';
import 'package:round_7_mobile_cure_team4/features/booking/domain/entities/reschedule_entity.dart';
import 'package:round_7_mobile_cure_team4/features/booking/domain/repositories/booking_repo.dart';

@Injectable(as: BookingRepo)
class BookingRepoImpl implements BookingRepo {
  final BookingSearchRemoteDataSource _bookingSearchDataSource;

  const BookingRepoImpl(this._bookingSearchDataSource);

  @override
  Future<List<BookingEntity>> searchBookings(String fromDate) async {
    try {
      final responseModels = await _bookingSearchDataSource.searchBookings(
        fromDate,
      );
      final responseEntities = responseModels
          .map((model) => model.toEntity())
          .toList();
      return responseEntities;
    } catch (e, stackTrace) {
      log('❌ Error in searchBookings: $e');
      log(stackTrace.toString());
      throw Exception('Failed to search bookings');
    }
  }

  @override
  Future<RescheduleResponseEntity> rescheduleBooking({
    required String id,
    required String newDateTime,
  }) async {
    try {
      final responseModel = await _bookingSearchDataSource.rescheduleBooking(
        id: id,
        date: newDateTime,
      );

      return responseModel.toEntity();
    } catch (e, stackTrace) {
      log('❌ Error in rescheduleBooking: $e');
      log(stackTrace.toString());
      throw Exception('Failed to reschedule booking');
    }
  }

  @override
  Future<RescheduleResponseEntity> cancelBooking({required String id}) async {
    try {
      final responseModel = await _bookingSearchDataSource.cancelBooking(
        id: id,
      );

      return responseModel.toEntity();
    } catch (e, stackTrace) {
      log('❌ Error in rescheduleBooking: $e');
      log(stackTrace.toString());
      throw Exception('Failed to reschedule booking');
    }
  }
}
