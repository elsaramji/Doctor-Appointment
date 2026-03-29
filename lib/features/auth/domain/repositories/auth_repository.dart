import 'package:dartz/dartz.dart';
import 'package:round_7_mobile_cure_team4/core/errors/errors.dart';
import 'package:round_7_mobile_cure_team4/features/auth/data/models/auth_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthModel>> login(String phoneNumber);

  Future<Either<Failure, AuthModel>> verifyLoginOtp(
    String phoneNumber,
    String otp,
  );

  Future<Either<Failure, AuthModel>> register(
    String phoneNumber,
    String name,
    String email,
  );

  Future<Either<Failure, AuthModel>> verifyRegisterOtp(
    String phoneNumber,
    String otp,
    String email,
  );
}
