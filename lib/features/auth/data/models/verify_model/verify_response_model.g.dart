// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VerifyResponseModel _$VerifyResponseModelFromJson(Map<String, dynamic> json) =>
    _VerifyResponseModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: VerifyDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VerifyResponseModelToJson(
  _VerifyResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_VerifyDataModel _$VerifyDataModelFromJson(Map<String, dynamic> json) =>
    _VerifyDataModel(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$VerifyDataModelToJson(_VerifyDataModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
