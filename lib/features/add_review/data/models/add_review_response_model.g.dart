// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_review_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddReviewResponseModel _$AddReviewResponseModelFromJson(
  Map<String, dynamic> json,
) => _AddReviewResponseModel(
  success: json['success'] as bool,
  message: json['message'] as String,
);

Map<String, dynamic> _$AddReviewResponseModelToJson(
  _AddReviewResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
};
