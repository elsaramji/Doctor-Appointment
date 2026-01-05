import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/booking/domain/entities/reschedule_entity.dart';
import 'package:round_7_mobile_cure_team4/features/booking/domain/repositories/booking_repo.dart';

@injectable
class RescheduleBookingUseCase {
  final BookingRepo _bookingRepository;

  const RescheduleBookingUseCase(this._bookingRepository);

  Future<RescheduleResponseEntity> call({
    required String id,
    required String  newDateTime,
  }) {
    return _bookingRepository.rescheduleBooking(
      id: id,
      newDateTime: newDateTime,
    );
  }

}
