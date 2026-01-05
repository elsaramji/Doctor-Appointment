import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/core/errors/errors.dart';
import 'package:round_7_mobile_cure_team4/core/helper/api_constants.dart';
import 'package:round_7_mobile_cure_team4/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:round_7_mobile_cure_team4/features/auth/data/models/auth_model/auth_response_model.dart';
import 'package:round_7_mobile_cure_team4/features/auth/data/models/register_model/register_request_model.dart';
import 'package:round_7_mobile_cure_team4/features/auth/data/models/verify_model/verify_request_model.dart';
import 'package:round_7_mobile_cure_team4/features/auth/data/models/verify_model/verify_response_model.dart';
import 'package:round_7_mobile_cure_team4/features/auth/domain/entities/auth_response.dart';
import 'package:round_7_mobile_cure_team4/features/auth/domain/entities/register_entity.dart';
import 'package:round_7_mobile_cure_team4/core/helper/dio_helper.dart';
import 'package:round_7_mobile_cure_team4/features/auth/domain/entities/verify_entity/verify_request_entity.dart';
import 'package:round_7_mobile_cure_team4/features/auth/domain/entities/verify_entity/verify_response_entity.dart';
import 'package:round_7_mobile_cure_team4/features/auth/domain/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _dataSource;

  final DioHelper dioHelper;

  AuthRepositoryImpl(this.dioHelper, this._dataSource);

  @override
  Future<Either<Failure, AuthResponseEntity>> login(String phoneNumber) async {
    try {
      final response = await _dataSource.login(phoneNumber);

      return Right(response.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, VerifyResponseEntity>> verifyLoginOtp(
    VerifyRequestEntity requestEntity,
  ) async {
    try {
      final requestModel = requestEntity.toModel();

      final response = await _dataSource.verifyOtp(
        requestModel,
        ApiConstant.verifyLoginEndPoint,
      );

      return Right(response.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, VerifyResponseEntity>> verifyRegisterOtp(
    VerifyRequestEntity requestEntity,
  ) async {
    try {
      final requestModel = requestEntity.toModel();

      final response = await _dataSource.verifyOtp(
        requestModel,
        ApiConstant.verifySignUpEndPoint,
      );

      return Right(response.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponseEntity>> register(
    RegisterRequestEntity requestEntity,
  ) async {
    try {
      final model = RegisterRequestModel.fromEntity(requestEntity);

      final response = await _dataSource.register(model);

      return Right(response.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
