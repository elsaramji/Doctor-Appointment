import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:round_7_mobile_cure_team4/features/booking/domain/entities/booking_entity.dart';

part 'booking_search_model.freezed.dart';

part 'booking_search_model.g.dart';

@freezed
abstract class BookingSearchModel with _$BookingSearchModel {
  const factory BookingSearchModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'doctorId') required int doctorId,
    @JsonKey(name: 'doctorName') required String doctorName,
    @JsonKey(name: 'doctorSpeciality') required String doctorSpeciality,
    @JsonKey(name: 'doctorImg') String? doctorImageUrl,
    @JsonKey(name: 'appointmentAt') required String appointmentAt,
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'amount') double? amount,
  }) = _BookingSearchModel;

  factory BookingSearchModel.fromJson(Map<String, dynamic> json) =>
      _$BookingSearchModelFromJson(json);
}

extension BookingSearchModelMapper on BookingSearchModel {
  BookingEntity toEntity() {
    return BookingEntity(
      id: id,
      doctorId: doctorId,
      doctorName: doctorName,
      doctorSpeciality: doctorSpeciality,
      doctorImageUrl: doctorImageUrl,
      appointmentAt: appointmentAt,
      status: status,
    );
  }
}
