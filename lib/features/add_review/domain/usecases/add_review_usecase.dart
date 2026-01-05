import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/add_review/domain/entities/add_review_request_entity.dart';
import 'package:round_7_mobile_cure_team4/features/add_review/domain/entities/add_review_response_entity.dart';
import 'package:round_7_mobile_cure_team4/features/add_review/domain/repositories/add_review_repo.dart';
@injectable
class AddReviewUseCase {
  final AddReviewRepository _repository;

  const AddReviewUseCase(this._repository);

  Future<AddReviewResponseEntity> call(
    AddReviewRequestEntity review,
  ) async {
    return await _repository.addReview(review);
  }
}
