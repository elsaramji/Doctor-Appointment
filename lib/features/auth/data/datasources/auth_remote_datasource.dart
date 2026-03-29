import 'package:round_7_mobile_cure_team4/features/auth/data/models/auth_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> register(String phoneNumber, String name, String email);

  Future<AuthModel> login(String phoneNumber);

  Future<AuthModel> verifyLoginOtp(
    String phoneNumber,
    String otp,
    String endPoint,
  );

  Future<AuthModel> verifyOtpRegisterApiCall(
    String email,
    String phoneNumber,
    String otp,
    String endpoint,
  );
}
