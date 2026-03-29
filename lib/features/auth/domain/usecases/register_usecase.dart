import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/core/errors/errors.dart';
import 'package:round_7_mobile_cure_team4/features/auth/domain/repositories/auth_repository.dart';

import '../../data/models/auth_model.dart';

@injectable
class RegisterUseCase {
  final AuthRepository _repository;

  const RegisterUseCase(this._repository);

  Future<Either<Failure, AuthModel>> call(
    String phoneNumber,
    String name,
    String email,
  ) async {
    return await _repository.register(phoneNumber, name, email);
  }
}
