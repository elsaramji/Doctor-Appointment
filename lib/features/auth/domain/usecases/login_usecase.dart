import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/core/errors/errors.dart';

import '../../data/models/auth_model.dart';
import '../repositories/auth_repository.dart';

@injectable
class LoginUseCase {
  final AuthRepository _authRepository;
  const LoginUseCase(this._authRepository);

  Future<Either<Failure, AuthModel>> call(String phoneNumber) {
    return _authRepository.login(phoneNumber);
  }
}
