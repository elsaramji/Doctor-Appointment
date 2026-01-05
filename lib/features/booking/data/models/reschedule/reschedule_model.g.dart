// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reschedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RescheduleRequest _$RescheduleRequestFromJson(Map<String, dynamic> json) =>
    _RescheduleRequest(newDateTime: json['newDateTime'] as String);

Map<String, dynamic> _$RescheduleRequestToJson(_RescheduleRequest instance) =>
    <String, dynamic>{'newDateTime': instance.newDateTime};

_RescheduleResponse _$RescheduleResponseFromJson(Map<String, dynamic> json) =>
    _RescheduleResponse(
      message: json['message'] as String,
      success: json['success'] as bool,
    );

Map<String, dynamic> _$RescheduleResponseToJson(_RescheduleResponse instance) =>
    <String, dynamic>{'message': instance.message, 'success': instance.success};
