import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/pay/data/api_call/payment_api_call.dart';
import 'package:round_7_mobile_cure_team4/features/pay/data/datasources/payment_remote_datasource.dart';
import 'package:round_7_mobile_cure_team4/features/pay/data/models/payment_request_model.dart';
import 'package:round_7_mobile_cure_team4/features/pay/data/models/payment_response_model.dart';

@LazySingleton(as: PaymentRemoteDataSource)
class PaymentRemoteDataSourceImpl implements PaymentRemoteDataSource {
  final PaymentApiCall _apiCall;

  PaymentRemoteDataSourceImpl(this._apiCall);

  @override
  Future<PaymentResponseModel> paymentRemoteDatasource(
    PaymentRequestModel requestModel,
  ) async {
    try {
      return await _apiCall.paymentApiCall(requestModel);
    } catch (e) {
      rethrow;
    }
  }
}
