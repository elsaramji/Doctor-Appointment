import 'package:dartz/dartz.dart';
import 'package:round_7_mobile_cure_team4/core/errors/errors.dart';
import 'package:round_7_mobile_cure_team4/features/auth/domain/entities/auth_response.dart';
import 'package:round_7_mobile_cure_team4/features/auth/domain/entities/register_entity.dart';
import 'package:round_7_mobile_cure_team4/features/auth/domain/entities/verify_entity/verify_request_entity.dart';
import 'package:round_7_mobile_cure_team4/features/auth/domain/entities/verify_entity/verify_response_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResponseEntity>> login(String phoneNumber);

  Future<Either<Failure, VerifyResponseEntity>> verifyLoginOtp(
    VerifyRequestEntity request,
  );

  Future<Either<Failure, AuthResponseEntity>> register(
    RegisterRequestEntity requestEntity,
  );

  Future<Either<Failure, VerifyResponseEntity>> verifyRegisterOtp(
    VerifyRequestEntity request,
  );
}
