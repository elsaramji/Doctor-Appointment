import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/auth/data/api_call/auth_api_call.dart';
import 'package:round_7_mobile_cure_team4/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:round_7_mobile_cure_team4/features/auth/data/models/auth_model.dart';

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthApiCall _apiCall;

  const AuthRemoteDataSourceImpl(this._apiCall);

  @override
  Future<AuthModel> register(
    String phoneNumber,
    String name,
    String email,
  ) async {
    try {
      final response = await _apiCall.registerApiCall(phoneNumber, name, email);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthModel> login(String phoneNumber) async {
    try {
      final response = await _apiCall.loginApiCall(phoneNumber);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthModel> verifyLoginOtp(
    String phoneNumber,
    String otp,
    String endPoint,
  ) async {
    try {
      final response = await _apiCall.verifyOtpApiCall(
        phoneNumber,
        otp,
        endPoint,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthModel> verifyOtpRegisterApiCall(
    String email,
    String phoneNumber,
    String otp,
    String endpoint,
  ) async {
    try {
      final response = await _apiCall.verifyOtpRegisterApiCall(
        phoneNumber,
        otp,
        email,
        endpoint,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
