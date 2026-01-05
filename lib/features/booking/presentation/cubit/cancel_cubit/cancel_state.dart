import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:round_7_mobile_cure_team4/features/booking/domain/entities/reschedule_entity.dart';

part 'cancel_state.freezed.dart';

@freezed
class CancelState with _$CancelState {
  const factory CancelState.initial() = _Initial;

  const factory CancelState.cancelLoading() = _CancelLoading;

  const factory CancelState.cancelSuccess(RescheduleResponseEntity data) = _CancelSuccess;

  const factory CancelState.cancelError(String message) = _CancelError;
}
