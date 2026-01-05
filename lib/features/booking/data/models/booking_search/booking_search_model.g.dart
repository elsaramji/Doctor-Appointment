// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookingSearchModel _$BookingSearchModelFromJson(Map<String, dynamic> json) =>
    _BookingSearchModel(
      id: (json['id'] as num).toInt(),
      doctorId: (json['doctorId'] as num).toInt(),
      doctorName: json['doctorName'] as String,
      doctorSpeciality: json['doctorSpeciality'] as String,
      doctorImageUrl: json['doctorImg'] as String?,
      appointmentAt: json['appointmentAt'] as String,
      status: json['status'] as String,
      address: json['address'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BookingSearchModelToJson(_BookingSearchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctorId': instance.doctorId,
      'doctorName': instance.doctorName,
      'doctorSpeciality': instance.doctorSpeciality,
      'doctorImg': instance.doctorImageUrl,
      'appointmentAt': instance.appointmentAt,
      'status': instance.status,
      'address': instance.address,
      'amount': instance.amount,
    };
