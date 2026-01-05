import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/pay/domain/entities/payment_request_entity.dart';
import 'package:round_7_mobile_cure_team4/features/pay/domain/entities/payment_response_entity.dart';
import 'package:round_7_mobile_cure_team4/features/pay/domain/repositories/payment_repo.dart';
@injectable
class PaymentUseCase {
  final PaymentRepository repository;

  PaymentUseCase(this.repository);

  Future<PaymentResponseEntity> call(PaymentRequestEntity request) {
    return repository.makePayment(request);
  }
}
