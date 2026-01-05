import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/booking/domain/entities/reschedule_entity.dart';
import 'package:round_7_mobile_cure_team4/features/booking/domain/usecases/reschedule_usecase.dart';
import 'package:round_7_mobile_cure_team4/features/booking/presentation/cubit/reschedule_cubit/reschedule_state.dart';
@injectable
class RescheduleCubit extends Cubit<RescheduleState> {
  final RescheduleBookingUseCase _rescheduleBookingUseCase;

  RescheduleCubit(this._rescheduleBookingUseCase) : super(const RescheduleState.initial());

  Future<void> rescheduleBooking({
    required String bookingId,
    required String newDateTimeString,
  }) async {
    emit(const RescheduleState.rescheduleLoading());

    try {

      final result = await _rescheduleBookingUseCase(
        id: bookingId,
        newDateTime:  newDateTimeString,
      );

      emit(
        RescheduleState.rescheduleSuccess(
          RescheduleResponseEntity(
            message: result.message,
            success: result.success,
          ),
        ),
      );
    } catch (e) {
      emit(RescheduleState.rescheduleError("Failed to reschedule: $e"));
    }
  }
}