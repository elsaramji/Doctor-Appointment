import 'package:round_7_mobile_cure_team4/features/pay/domain/entities/payment_request_entity.dart';
import 'package:round_7_mobile_cure_team4/features/pay/domain/entities/payment_response_entity.dart';

abstract class PaymentRepository {
  Future<PaymentResponseEntity> makePayment(
      PaymentRequestEntity request,
      );
}
