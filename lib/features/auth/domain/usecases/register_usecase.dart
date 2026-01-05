import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/core/errors/errors.dart';
import 'package:round_7_mobile_cure_team4/features/auth/domain/entities/auth_response.dart';
import 'package:round_7_mobile_cure_team4/features/auth/domain/entities/register_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:round_7_mobile_cure_team4/features/auth/domain/repositories/auth_repository.dart';

@injectable
class RegisterUseCase {
  final AuthRepository _repository;

  const RegisterUseCase(this._repository);

  Future<Either<Failure, AuthResponseEntity>> call(RegisterRequestEntity request) async {
    return await _repository.register(request);
  }
}
