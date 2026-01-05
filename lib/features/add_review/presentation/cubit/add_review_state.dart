import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:round_7_mobile_cure_team4/features/add_review/domain/entities/add_review_response_entity.dart';

part 'add_review_state.freezed.dart';
@freezed
abstract class AddReviewState with _$AddReviewState {
  const factory AddReviewState.initial() = _Initial;
  const factory AddReviewState.loading() = _Loading;
  const factory AddReviewState.success({
    required AddReviewResponseEntity response,
}) = _Success;
  const factory AddReviewState.error({required String error}) = _Error;

}
