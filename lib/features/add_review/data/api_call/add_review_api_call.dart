import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/core/helper/api_constants.dart';
import 'package:round_7_mobile_cure_team4/core/helper/dio_helper.dart';
import 'package:round_7_mobile_cure_team4/features/add_review/data/models/add_review_request_model.dart';
import 'package:round_7_mobile_cure_team4/features/add_review/data/models/add_review_response_model.dart';
@LazySingleton()
class AddReviewApiCall {
  final DioHelper _dioHelper;

  const AddReviewApiCall(this._dioHelper);

  Future<AddReviewResponseModel> addReviewApiCall(
    AddReviewRequestModel requestModel,
  ) async {
    final response = await _dioHelper.postRequest(
      ApiConstant.addReviewEndPoint,
      requestModel.toJson(),
    );
    if (response != null && response.statusCode == 200) {
      return AddReviewResponseModel.fromJson(response.data);
    } else {
      throw Exception(
        'payment failed: ${response?.statusCode} - ${response?.data}',
      );
    }
  }
}
