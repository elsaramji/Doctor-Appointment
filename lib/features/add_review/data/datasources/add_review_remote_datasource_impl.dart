import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/add_review/data/api_call/add_review_api_call.dart';
import 'package:round_7_mobile_cure_team4/features/add_review/data/datasources/add_review_remote_datasource.dart';
import 'package:round_7_mobile_cure_team4/features/add_review/data/models/add_review_request_model.dart';
import 'package:round_7_mobile_cure_team4/features/add_review/data/models/add_review_response_model.dart';

@LazySingleton(as: AddReviewRemoteDatasource)
class AddReviewRemoteDatasourceImpl implements AddReviewRemoteDatasource {
  final AddReviewApiCall _apiCall;

  const AddReviewRemoteDatasourceImpl(this._apiCall);

  @override
  Future<AddReviewResponseModel> addReview(AddReviewRequestModel requestModel) {
    return _apiCall.addReviewApiCall(requestModel);
  }
}
