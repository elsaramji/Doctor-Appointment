import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/helper/dio_helper.dart';
import '../../../../core/helper/api_constants.dart';

@LazySingleton()
class PaymentRemoteDataSource {
  final DioHelper _dioHelper;
  PaymentRemoteDataSource(this._dioHelper);

  Future<Response?> addPaymentMethod(Map<String, dynamic> data, String token) async {
    return await _dioHelper.postRequest(
      ApiConstant.addPaymentMethod,
      data,
    );
  }


  Future<Response?> getAllPayments(String token,{String? methodName} ) async {
    return await _dioHelper.getRequest(
      ApiConstant.getAllPayments,

      queryParameters: methodName != null ? {'methodName': methodName} : null,
    );
  }
}

