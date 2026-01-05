import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:round_7_mobile_cure_team4/features/doctor_details/domain/entities/doctor_details_entity.dart';

part 'doctor_details_state.freezed.dart';

@freezed
class DoctorDetailsState with _$DoctorDetailsState {
  const factory DoctorDetailsState.initial() = _Initial;
  const factory DoctorDetailsState.loading() = _Loading;

  const factory DoctorDetailsState.loaded({
    required DoctorDetailsEntity doctorDetails,
    required List<String> availableDates,

    /// Map<Date, List<{time, slotId}>>
    required Map<String, List<Map<String, dynamic>>> availableTimesByDate,
  }) = _Loaded;

  const factory DoctorDetailsState.error({
    required String message,
  }) = _Error;
}
