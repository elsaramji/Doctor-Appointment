import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:round_7_mobile_cure_team4/features/booking/domain/entities/reschedule_entity.dart';

part 'reschedule_model.freezed.dart';
part 'reschedule_model.g.dart';

/// ----------------------
/// Request Model
/// ----------------------
@freezed
abstract class RescheduleRequest with _$RescheduleRequest {
  const factory RescheduleRequest({
    required String newDateTime, // API requires string (e.g., 2025-11-20T14:00:00)
  }) = _RescheduleRequest;

  factory RescheduleRequest.fromJson(Map<String, dynamic> json) =>
      _$RescheduleRequestFromJson(json);
}

/// ----------------------
/// Response Model
/// ----------------------
@freezed
abstract class RescheduleResponse with _$RescheduleResponse {
  const factory RescheduleResponse({
    required String message,
    required bool success,
  }) = _RescheduleResponse;

  factory RescheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$RescheduleResponseFromJson(json);
}

/// ======================================
/// EXTENSIONS FOR ENTITY <-> MODEL MAPPING
/// ======================================

/// Model ➜ Entity
extension RescheduleRequestMapper on RescheduleRequest {
  RescheduleEntity toEntity() {
    return RescheduleEntity(
      newDateTime: newDateTime,
    );
  }
}

/// Entity ➜ Model
extension RescheduleRequestFromEntity on RescheduleEntity {
  RescheduleRequest toModel() {
    return RescheduleRequest(
      newDateTime: newDateTime,
    );
  }
}

/// Response Model ➜ Response Entity
extension RescheduleResponseMapper on RescheduleResponse {
  RescheduleResponseEntity toEntity() {
    return RescheduleResponseEntity(
      message: message,
      success: success,
    );
  }
}