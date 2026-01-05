import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/core/helper/api_constants.dart';
import 'package:round_7_mobile_cure_team4/core/helper/dio_helper.dart';
import 'package:round_7_mobile_cure_team4/core/helper/token_storage.dart';
import 'package:round_7_mobile_cure_team4/features/auth/data/models/register_model/register_request_model.dart';
import 'package:round_7_mobile_cure_team4/features/auth/data/models/auth_model/auth_response_model.dart';
import 'package:round_7_mobile_cure_team4/features/auth/data/models/verify_model/verify_request_model.dart';
import 'package:round_7_mobile_cure_team4/features/auth/data/models/verify_model/verify_response_model.dart';

@LazySingleton()
class AuthApiCall {
  final DioHelper _dioHelper;
  final TokenStorage _tokenStorage = TokenStorage();

  AuthApiCall(this._dioHelper);

  /// Register API Call
  Future<AuthResponseModel> registerApiCall(
    RegisterRequestModel registerModel,
  ) async {
    try {
      final response = await _dioHelper.postRequest(
        ApiConstant.registerEndPoint,
        registerModel.toJson(),
      );

      return AuthResponseModel.fromJson(response?.data);
    } catch (e) {
      rethrow;
    }
  }

  /// Login API Call
  Future<AuthResponseModel> loginApiCall(String phoneNumber) async {
    try {
      final response = await _dioHelper.postRequest(ApiConstant.loginEndPoint, {
        "phoneNumber": phoneNumber,
      });

      return AuthResponseModel.fromJson(response?.data);
    } catch (e) {
      rethrow;
    }
  }

  /// Verify OTP API Call

  Future<VerifyResponseModel> verifyOtpApiCall(
    VerifyRequestModel verifyModel,
    String endpoint,
  ) async {
    try {
      final response = await _dioHelper.postRequest(
        endpoint,
        verifyModel.toJson(),
      );

      final model = VerifyResponseModel.fromJson(response?.data);
      final entity = model.toEntity();

      await _tokenStorage.saveTokens(entity.accessToken, entity.refreshToken);

      return model;
    } catch (e) {
      rethrow;
    }
  }
}
