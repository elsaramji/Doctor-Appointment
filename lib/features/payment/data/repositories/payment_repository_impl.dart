import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/core/helper/token_storage.dart';
import '../../../../core/errors/errors.dart';
import '../../domain/entities/payment_method.dart';
import '../../domain/repositories/payment_repository.dart';
import '../datasources/payment_remote_datasource.dart';

@LazySingleton(as: PaymentRepository)
class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentRemoteDataSource remoteDataSource;
  final TokenStorage _tokenStorage;

  PaymentRepositoryImpl(this.remoteDataSource, this._tokenStorage);

  @override
  Future<Either<Failure, PaymentMethod>> addPaymentMethod(Map<String, dynamic> data) async {
    try {
      final token = await _tokenStorage.getAccessToken();
      if (token == null) return Left(ServerFailure(message: "No access token found"));

      final response = await remoteDataSource.addPaymentMethod(data, token);
      if (response != null && response.statusCode == 200) {
        final json = response.data['data'];
        final payment = PaymentMethod.fromJson(json);
        return Right(payment);
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PaymentMethod>>> getPaymentMethods({String? methodName}) async {
    try {
      final token = await _tokenStorage.getAccessToken();
      if (token == null) return Left(ServerFailure(message: "No access token found"));

      final response = await remoteDataSource.getAllPayments(token, methodName: methodName);
      if (response != null && response.statusCode == 200) {
        final List data = response.data['data'];
        final payments = data.map((e) => PaymentMethod.fromJson(e)).toList();
        return Right(payments);
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
