
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:round_7_mobile_cure_team4/features/booking/domain/entities/reschedule_entity.dart';

part 'reschedule_state.freezed.dart';
@freezed
class RescheduleState with _$RescheduleState {
  const factory RescheduleState.initial() = _Initial;
  const factory RescheduleState.rescheduleLoading() = _RescheduleLoading;
  const factory RescheduleState.rescheduleSuccess(RescheduleResponseEntity response) = _RescheduleSuccess;
  const factory RescheduleState.rescheduleError(String message) = _RescheduleError;

}
