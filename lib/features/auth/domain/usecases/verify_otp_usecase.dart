import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/core/errors/errors.dart';
import 'package:round_7_mobile_cure_team4/features/auth/data/models/auth_model.dart';
import 'package:round_7_mobile_cure_team4/features/auth/domain/repositories/auth_repository.dart';

@injectable
class VerifyLoginUseCase {
  final AuthRepository _authRepository;

  const VerifyLoginUseCase(this._authRepository);

  Future<Either<Failure, AuthModel>> call(
    String phoneNumber,
    String otp,
  ) async => await _authRepository.verifyLoginOtp(phoneNumber, otp);
}

@injectable
class VerifySignUpUseCase {
  final AuthRepository _authRepository;

  const VerifySignUpUseCase(this._authRepository);

  Future<Either<Failure, AuthModel>> call(
    String phoneNumber,
    String otp,
    String email,
  ) async => await _authRepository.verifyRegisterOtp(phoneNumber, otp, email);
}
