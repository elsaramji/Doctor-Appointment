// add_payment_usecase.dart
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/errors.dart';
import '../entities/payment_method.dart';
import '../repositories/payment_repository.dart';
@injectable
class AddPaymentMethodUseCase {
  final PaymentRepository repository;

  AddPaymentMethodUseCase(this.repository);

  Future<Either<Failure, PaymentMethod>> call(Map<String, dynamic> data, String token) {
    return repository.addPaymentMethod(data);
  }
}
