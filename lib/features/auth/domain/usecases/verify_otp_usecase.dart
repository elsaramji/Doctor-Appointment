import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/core/errors/errors.dart';
import 'package:round_7_mobile_cure_team4/features/auth/domain/entities/verify_entity/verify_request_entity.dart';
import 'package:round_7_mobile_cure_team4/features/auth/domain/entities/verify_entity/verify_response_entity.dart';
import 'package:round_7_mobile_cure_team4/features/auth/domain/repositories/auth_repository.dart';
@injectable
class VerifyLoginUseCase {
  final AuthRepository _authRepository;

  const VerifyLoginUseCase(this._authRepository);

  Future<Either<Failure, VerifyResponseEntity>> call(
    VerifyRequestEntity request,
  ) async => await _authRepository.verifyLoginOtp(request);
}
@injectable
class VerifySignUpUseCase {
  final AuthRepository _authRepository;

  const VerifySignUpUseCase(this._authRepository);

  Future<Either<Failure, VerifyResponseEntity>> call(
    VerifyRequestEntity request,
  ) async => await _authRepository.verifyRegisterOtp(request);
}
