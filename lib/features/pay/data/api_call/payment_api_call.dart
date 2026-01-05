import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/core/helper/api_constants.dart';
import 'package:round_7_mobile_cure_team4/core/helper/dio_helper.dart';
import 'package:round_7_mobile_cure_team4/features/pay/data/models/payment_request_model.dart';
import 'package:round_7_mobile_cure_team4/features/pay/data/models/payment_response_model.dart';
@LazySingleton()

class PaymentApiCall {
  final DioHelper _dio;

  PaymentApiCall(this._dio);

  Future<PaymentResponseModel> paymentApiCall(
    PaymentRequestModel requestModel,
  ) async {
    final response = await _dio.postRequest(
      ApiConstant.payEndPoint,
      requestModel.toJson(),
    );

    if (response != null && response.statusCode == 200) {
      return PaymentResponseModel.fromJson(response.data);
    } else {
      throw Exception(
        'payment failed: ${response?.statusCode} - ${response?.data}',
      );
    }
  }
}
