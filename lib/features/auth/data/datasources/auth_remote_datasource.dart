import 'package:round_7_mobile_cure_team4/features/auth/data/models/auth_model/auth_response_model.dart';
import 'package:round_7_mobile_cure_team4/features/auth/data/models/register_model/register_request_model.dart';
import 'package:round_7_mobile_cure_team4/features/auth/data/models/verify_model/verify_request_model.dart';
import 'package:round_7_mobile_cure_team4/features/auth/data/models/verify_model/verify_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> register(RegisterRequestModel request);

  Future<AuthResponseModel> login(String phoneNumber);

  Future<VerifyResponseModel> verifyOtp(
    VerifyRequestModel request,
    String endPoint,
  );
}
