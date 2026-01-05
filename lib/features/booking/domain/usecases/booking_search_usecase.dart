import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/booking/domain/entities/booking_entity.dart';
import 'package:round_7_mobile_cure_team4/features/booking/domain/repositories/booking_repo.dart';

@injectable
class BookingSearchUseCase {
  final BookingRepo _bookingRepository;

  const BookingSearchUseCase(this._bookingRepository);

  Future<List<BookingEntity>> call(String fromDate) {
    return _bookingRepository.searchBookings(fromDate);
  }

}
