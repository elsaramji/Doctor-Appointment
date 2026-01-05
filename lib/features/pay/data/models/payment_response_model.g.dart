// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentResponseModel _$PaymentResponseModelFromJson(
  Map<String, dynamic> json,
) => _PaymentResponseModel(
  success: json['success'] as bool? ?? false,
  message: json['message'] as String? ?? '',
  data: json['data'] == null
      ? null
      : PaymentDataModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PaymentResponseModelToJson(
  _PaymentResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_PaymentDataModel _$PaymentDataModelFromJson(Map<String, dynamic> json) =>
    _PaymentDataModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      doctorId: (json['doctorId'] as num?)?.toInt() ?? 0,
      doctorName: json['doctorName'] as String? ?? '',
      doctorSpeciality: json['doctorSpeciality'] as String? ?? '',
      doctorImg: json['doctorImg'] as String? ?? '',
      patientId: (json['patientId'] as num?)?.toInt() ?? 0,
      patientName: json['patientName'] as String? ?? '',
      paymentMethod: json['payment'] as String? ?? '',
      status: json['status'] as String? ?? '',
      paymentUrl: json['paymentUrl'] as String? ?? '',
      appointmentAt: json['appointmentAt'] == null
          ? null
          : DateTime.parse(json['appointmentAt'] as String),
    );

Map<String, dynamic> _$PaymentDataModelToJson(_PaymentDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctorId': instance.doctorId,
      'doctorName': instance.doctorName,
      'doctorSpeciality': instance.doctorSpeciality,
      'doctorImg': instance.doctorImg,
      'patientId': instance.patientId,
      'patientName': instance.patientName,
      'payment': instance.paymentMethod,
      'status': instance.status,
      'paymentUrl': instance.paymentUrl,
      'appointmentAt': instance.appointmentAt?.toIso8601String(),
    };
