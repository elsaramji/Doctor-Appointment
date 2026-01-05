import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/profile/data/models/profile_model.dart';

import '../../domain/repositories/profile_repo.dart';
import '../datasources/profile_remote_datasource.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl(this.remoteDataSource);

  @override
  Future<ProfileModel> getProfile() async {
    return await remoteDataSource.getProfile();
  }

  @override
  Future<bool> updateProfile({
    required String name,
    required String email,
    required String phone,
    required String address,
    required String birthDate,
    String? imgFile,
    double? latitude,
    double? longitude,
    String? token,
  }) async {
    return await remoteDataSource.updateProfile(
      name: name,
      email: email,
      phone: phone,
      address: address,
      birthDate: birthDate,
      imgFile: imgFile,
      latitude: latitude,
      longitude: longitude,
      token: token,
    );
  }
}

