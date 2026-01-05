import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/booking/domain/usecases/booking_search_usecase.dart';

import 'booking_state.dart';

@injectable
class BookingCubit extends Cubit<BookingState> {
  final BookingSearchUseCase _bookingSearchUseCase;

  BookingCubit(this._bookingSearchUseCase)
    : super(const BookingState.initial());

  // ----------------------------
  // SEARCH BOOKINGS
  // ----------------------------
  Future<void> searchBookings(DateTime selectedDay) async {
    emit(const BookingState.loading());

    final fromDate =
        "${selectedDay.year}-${selectedDay.month.toString().padLeft(2, '0')}-${selectedDay.day.toString().padLeft(2, '0')}";

    try {
      final bookings = await _bookingSearchUseCase(fromDate);

      final filtered = bookings.where((booking) {
        final date = DateTime.parse(booking.appointmentAt);
        return date.year == selectedDay.year &&
            date.month == selectedDay.month &&
            date.day == selectedDay.day;
      }).toList();

      emit(BookingState.loaded(bookings: filtered));
    } catch (e) {
      emit(BookingState.error(message: "Failed to fetch bookings: $e"));
    }
  }

}
