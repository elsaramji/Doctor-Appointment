import 'package:round_7_mobile_cure_team4/features/add_review/data/models/add_review_request_model.dart';
import 'package:round_7_mobile_cure_team4/features/add_review/data/models/add_review_response_model.dart';

abstract class AddReviewRemoteDatasource {
  Future<AddReviewResponseModel> addReview(AddReviewRequestModel requestModel);
}
