import 'package:round_7_mobile_cure_team4/features/add_review/domain/entities/add_review_request_entity.dart';
import 'package:round_7_mobile_cure_team4/features/add_review/domain/entities/add_review_response_entity.dart';

abstract class AddReviewRepository {
  Future<AddReviewResponseEntity> addReview(AddReviewRequestEntity request);
}
