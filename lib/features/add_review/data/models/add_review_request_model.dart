import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:round_7_mobile_cure_team4/features/add_review/domain/entities/add_review_request_entity.dart';

part 'add_review_request_model.freezed.dart';
part 'add_review_request_model.g.dart';

@freezed
abstract class AddReviewRequestModel with _$AddReviewRequestModel {
  const factory AddReviewRequestModel({
    @JsonKey(name: 'doctorId') required int doctorId,
    @JsonKey(name: 'rating') required int rating,
    @JsonKey(name: 'comment') required String comment,
  }) = _AddReviewRequestModel;

  factory AddReviewRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AddReviewRequestModelFromJson(json);

  factory AddReviewRequestModel.fromEntity(AddReviewRequestEntity entity) =>
      AddReviewRequestModel(
        doctorId: entity.doctorId,
        rating: entity.rating,
        comment: entity.comment,
      );
}

/// ✅ Extension to convert model → entity
extension AddReviewRequestModelX on AddReviewRequestModel {
  AddReviewRequestEntity toEntity() {
    return AddReviewRequestEntity(
      doctorId: doctorId,
      rating: rating,
      comment: comment,
    );
  }
}

/// ✅ Extension to convert entity → model
extension AddReviewRequestEntityX on AddReviewRequestEntity {
  AddReviewRequestModel toModel() {
    return AddReviewRequestModel(
      doctorId: doctorId,
      rating: rating,
      comment: comment,
    );
  }
}
