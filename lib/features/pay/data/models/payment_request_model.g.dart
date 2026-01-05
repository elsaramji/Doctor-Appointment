// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentRequestModel _$PaymentRequestModelFromJson(Map<String, dynamic> json) =>
    _PaymentRequestModel(
      doctorId: (json['DoctorId'] as num).toInt(),
      slotId: (json['SlotId'] as num).toInt(),
      amount: (json['Amount'] as num).toDouble(),
      payment: (json['Payment'] as num).toInt(),
      status: (json['Status'] as num).toInt(),
      appointmentAt: json['AppointmentAt'] as String,
    );

Map<String, dynamic> _$PaymentRequestModelToJson(
  _PaymentRequestModel instance,
) => <String, dynamic>{
  'DoctorId': instance.doctorId,
  'SlotId': instance.slotId,
  'Amount': instance.amount,
  'Payment': instance.payment,
  'Status': instance.status,
  'AppointmentAt': instance.appointmentAt,
};
