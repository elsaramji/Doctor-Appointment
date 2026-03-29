import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/core/helper/api_constants.dart';
import 'package:round_7_mobile_cure_team4/core/helper/dio_helper.dart';
import 'package:round_7_mobile_cure_team4/core/helper/token_storage.dart';

import '../models/auth_model.dart';

@LazySingleton()
class AuthApiCall {
  final DioHelper _dioHelper;
  final TokenStorage _tokenStorage = TokenStorage();

  AuthApiCall(this._dioHelper);

  /// Register API Call
  Future<AuthModel> registerApiCall(
    String phoneNumber,
    String name,
    String email,
  ) async {
    try {
      final response = await _dioHelper.postRequest(
        ApiConstant.registerEndPoint,
        {"fullName": name, "phoneNumber": "+2$phoneNumber", "email": email},
      );

      return AuthModel.fromJson(response?.data);
    } catch (e) {
      rethrow;
    }
  }

  /// Login API Call
  Future<AuthModel> loginApiCall(String phoneNumber) async {
    try {
      final response = await _dioHelper.postRequest(ApiConstant.loginEndPoint, {
        "phoneNumber": phoneNumber,
      });

      return AuthModel.fromJson(response?.data);
    } catch (e) {
      rethrow;
    }
  }

  /// login verify otp API Call

  Future<AuthModel> verifyOtpApiCall(
    String phoneNumber,
    String otp,
    String endpoint,
  ) async {
    try {
      final response = await _dioHelper.postRequest(endpoint, {
        "phoneNumber": "+2$phoneNumber",
        "otp": otp,
      });
      final result = AuthModel.fromJson(response?.data);
      await _tokenStorage.saveTokens(
        result.data!.token,
        result.data!.refreshToken,
      );
      return result;
    } catch (e) {
      rethrow;
    }
  }

  // verify otp for register
  Future<AuthModel> verifyOtpRegisterApiCall(
    String phoneNumber,
    String otp,
    String email,
    String endpoint,
  ) async {
    try {
      final response = await _dioHelper.postRequest(endpoint, {
        "phoneNumber": "+2$phoneNumber",
        "otpNumber": otp,
        "email": email,
      });
      final result = AuthModel.fromJson(response?.data);
      await _tokenStorage.saveTokens(
        result.data!.token,
        result.data!.refreshToken,
      );
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
