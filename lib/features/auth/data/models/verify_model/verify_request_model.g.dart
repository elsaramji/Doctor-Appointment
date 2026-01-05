// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VerifyRequestModel _$VerifyRequestModelFromJson(Map<String, dynamic> json) =>
    _VerifyRequestModel(
      phoneNumber: json['phoneNumber'] as String,
      otpNumber: json['otpNumber'] as String,
    );

Map<String, dynamic> _$VerifyRequestModelToJson(_VerifyRequestModel instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'otpNumber': instance.otpNumber,
    };
