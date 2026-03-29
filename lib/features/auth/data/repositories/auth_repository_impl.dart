import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/core/errors/errors.dart';
import 'package:round_7_mobile_cure_team4/core/helper/api_constants.dart';
import 'package:round_7_mobile_cure_team4/core/helper/dio_helper.dart';
import 'package:round_7_mobile_cure_team4/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:round_7_mobile_cure_team4/features/auth/domain/repositories/auth_repository.dart';

import '../models/auth_model.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _dataSource;

  final DioHelper dioHelper;

  AuthRepositoryImpl(this.dioHelper, this._dataSource);

  @override
  Future<Either<Failure, AuthModel>> login(String phoneNumber) async {
    try {
      final response = await _dataSource.login(phoneNumber);

      return Right(response);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthModel>> verifyLoginOtp(
    String phoneNumber,
    String otp,
  ) async {
    try {
      final response = await _dataSource.verifyLoginOtp(
        phoneNumber,
        otp,
        ApiConstant.verifyLoginEndPoint,
      );

      return Right(response);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthModel>> verifyRegisterOtp(
    String phoneNumber,
    String otp,
    String email,
  ) async {
    try {
      final response = await _dataSource.verifyOtpRegisterApiCall(
        email,
        phoneNumber,
        otp,
        ApiConstant.verifySignUpEndPoint,
      );

      return Right(response);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthModel>> register(
    String phoneNumber,
    String name,
    String email,
  ) async {
    try {
      log("phoneNumber: $phoneNumber, name: $name, email: $email");
      final response = await _dataSource.register(phoneNumber, name, email);
      log("response: ${response.toString()}");
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
