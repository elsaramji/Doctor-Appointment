import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/core/errors/errors.dart';
import 'package:round_7_mobile_cure_team4/features/auth/domain/entities/auth_response.dart';

import '../repositories/auth_repository.dart';


@injectable
class LoginUseCase {
  final AuthRepository _authRepository;
  const LoginUseCase(this._authRepository);

  Future<Either<Failure, AuthResponseEntity>> call(String phoneNumber) {
    return _authRepository.login(phoneNumber);
  }
}
