import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:round_7_mobile_cure_team4/features/booking/domain/entities/booking_entity.dart';

part 'booking_state.freezed.dart';

@freezed
class BookingState with _$BookingState {
  const factory BookingState.initial() = _Initial;
  const factory BookingState.loading() = _Loading;

  const factory BookingState.loaded({
    required List<BookingEntity> bookings,
  }) = _Loaded;

  const factory BookingState.error({
    required String message,
  }) = _Error;

}
