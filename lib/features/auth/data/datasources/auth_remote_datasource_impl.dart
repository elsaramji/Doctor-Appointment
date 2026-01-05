import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/auth/data/api_call/auth_api_call.dart';
import 'package:round_7_mobile_cure_team4/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:round_7_mobile_cure_team4/features/auth/data/models/auth_model/auth_response_model.dart';
import 'package:round_7_mobile_cure_team4/features/auth/data/models/register_model/register_request_model.dart';
import 'package:round_7_mobile_cure_team4/features/auth/data/models/verify_model/verify_request_model.dart';
import 'package:round_7_mobile_cure_team4/features/auth/data/models/verify_model/verify_response_model.dart';

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthApiCall _apiCall;

  const AuthRemoteDataSourceImpl(this._apiCall);

  @override
  Future<AuthResponseModel> register(RegisterRequestModel request) async {
    try {
      final response = await _apiCall.registerApiCall(request);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthResponseModel> login(String phoneNumber) async {
    try {
      final response = await _apiCall.loginApiCall(phoneNumber);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<VerifyResponseModel> verifyOtp(VerifyRequestModel request, String endPoint) async {
    try {
      final response = await _apiCall.verifyOtpApiCall(request, endPoint);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
