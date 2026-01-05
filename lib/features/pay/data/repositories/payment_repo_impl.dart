import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/pay/data/datasources/payment_remote_datasource.dart';
import 'package:round_7_mobile_cure_team4/features/pay/data/models/payment_request_model.dart';
import 'package:round_7_mobile_cure_team4/features/pay/data/models/payment_response_model.dart';
import 'package:round_7_mobile_cure_team4/features/pay/domain/entities/payment_request_entity.dart';
import 'package:round_7_mobile_cure_team4/features/pay/domain/entities/payment_response_entity.dart';
import 'package:round_7_mobile_cure_team4/features/pay/domain/repositories/payment_repo.dart';
@Injectable(as: PaymentRepository)
class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentRemoteDataSource _dataSource;

  PaymentRepositoryImpl(this._dataSource);

  @override
  Future<PaymentResponseEntity> makePayment(
    PaymentRequestEntity request,
  ) async {
    try {
      final requestModel = request.toModel();
      final responseModel = await _dataSource.paymentRemoteDatasource(
        requestModel,
      );
      return responseModel.toEntity();
    } catch (e, stackTrace) {
      log('❌ Error in makePayment: $e');
      log(stackTrace.toString());
      throw Exception('Failed to make  payment');
    }
  }
}
