import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/booking/domain/entities/reschedule_entity.dart';
import 'package:round_7_mobile_cure_team4/features/booking/domain/usecases/cancel_usecase.dart';
import 'cancel_state.dart';

@injectable
class CancelBookingCubit extends Cubit<CancelState> {
  final CancelBookingUseCase _cancelBookingUseCase;

  CancelBookingCubit(this._cancelBookingUseCase)
      : super(const CancelState.initial());

  Future<void> cancelBooking({required String bookingId}) async {
    emit(const CancelState.cancelLoading());

    try {
      final result = await _cancelBookingUseCase(id: bookingId);

      emit(
        CancelState.cancelSuccess(
          RescheduleResponseEntity(
            message: result.message,
            success: result.success,
          ),
        ),
      );
    } catch (e) {
      emit(CancelState.cancelError("Failed to cancel: $e"));
    }
  }
}
