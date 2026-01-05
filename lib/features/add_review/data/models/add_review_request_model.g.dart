// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_review_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddReviewRequestModel _$AddReviewRequestModelFromJson(
  Map<String, dynamic> json,
) => _AddReviewRequestModel(
  doctorId: (json['doctorId'] as num).toInt(),
  rating: (json['rating'] as num).toInt(),
  comment: json['comment'] as String,
);

Map<String, dynamic> _$AddReviewRequestModelToJson(
  _AddReviewRequestModel instance,
) => <String, dynamic>{
  'doctorId': instance.doctorId,
  'rating': instance.rating,
  'comment': instance.comment,
};
