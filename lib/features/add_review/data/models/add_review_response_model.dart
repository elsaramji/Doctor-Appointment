import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:round_7_mobile_cure_team4/features/add_review/domain/entities/add_review_response_entity.dart';

part 'add_review_response_model.freezed.dart';
part 'add_review_response_model.g.dart';

@freezed
abstract class AddReviewResponseModel with _$AddReviewResponseModel {
  const factory AddReviewResponseModel({
    required bool success,
    required String message,
  }) = _AddReviewResponseModel;

  factory AddReviewResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AddReviewResponseModelFromJson(json);

  factory AddReviewResponseModel.fromEntity(AddReviewResponseEntity entity) =>
      AddReviewResponseModel(
        success: entity.success,
        message: entity.message,
      );
}

/// ✅ Extension to convert model → entity
extension AddReviewResponseModelX on AddReviewResponseModel {
  AddReviewResponseEntity toEntity() {
    return AddReviewResponseEntity(
      success: success,
      message: message,
    );
  }
}
