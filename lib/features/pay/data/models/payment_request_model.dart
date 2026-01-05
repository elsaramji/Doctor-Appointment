import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:round_7_mobile_cure_team4/features/pay/domain/entities/payment_request_entity.dart';

part 'payment_request_model.freezed.dart';
part 'payment_request_model.g.dart';

@freezed
abstract class PaymentRequestModel with _$PaymentRequestModel {
  const factory PaymentRequestModel({
    @JsonKey(name: 'DoctorId') required int doctorId,
    @JsonKey(name: 'SlotId') required int slotId,
    @JsonKey(name: 'Amount') required double amount,
    @JsonKey(name: 'Payment') required int payment,
    @JsonKey(name: 'Status') required int status,
    @JsonKey(name: 'AppointmentAt') required String appointmentAt,
  }) = _PaymentRequestModel;

  factory PaymentRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentRequestModelFromJson(json);
}

extension PaymentRequestModelMapper on PaymentRequestModel {
  PaymentRequestEntity toEntity() {
    return PaymentRequestEntity(
      doctorId: doctorId,
      slotId: slotId,
      amount: amount,
      payment: payment,
      status: status,
      appointmentAt: appointmentAt,
    );
  }
}
extension PaymentRequestEntityMapper on PaymentRequestEntity {
  PaymentRequestModel toModel() {
    return PaymentRequestModel(
      doctorId: doctorId,
      slotId: slotId,
      amount: amount,
      payment: payment,
      status: status,
      appointmentAt: appointmentAt,
    );
  }
}
