import 'package:round_7_mobile_cure_team4/features/pay/data/models/payment_request_model.dart';
import 'package:round_7_mobile_cure_team4/features/pay/data/models/payment_response_model.dart';

abstract class PaymentRemoteDataSource{
  Future<PaymentResponseModel> paymentRemoteDatasource( PaymentRequestModel requestModel);
}