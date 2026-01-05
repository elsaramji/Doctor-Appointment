import 'package:dartz/dartz.dart';
import '../../../../core/errors/errors.dart';
import '../entities/payment_method.dart';

abstract class PaymentRepository {
  Future<Either<Failure, PaymentMethod>> addPaymentMethod(Map<String, dynamic> data);
  Future<Either<Failure, List<PaymentMethod>>> getPaymentMethods({String? methodName});
}

