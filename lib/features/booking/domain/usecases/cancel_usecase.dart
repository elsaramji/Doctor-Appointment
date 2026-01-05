import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/booking/domain/entities/reschedule_entity.dart';
import 'package:round_7_mobile_cure_team4/features/booking/domain/repositories/booking_repo.dart';

@injectable
class CancelBookingUseCase {
  final BookingRepo _bookingRepository;

  const CancelBookingUseCase(this._bookingRepository);

  Future<RescheduleResponseEntity> call({
    required String id,
  }) {
    return _bookingRepository.cancelBooking(
      id: id,
    );
  }
}
