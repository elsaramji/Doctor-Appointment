import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/errors.dart';
import '../entities/payment_method.dart';
import '../repositories/payment_repository.dart';

@LazySingleton()
class GetPaymentMethods {
  final PaymentRepository repository;
  GetPaymentMethods(this.repository);

  Future<Either<Failure, List<PaymentMethod>>> call(String token, {String? methodName}) {
    return repository.getPaymentMethods( methodName: methodName);
  }

}
