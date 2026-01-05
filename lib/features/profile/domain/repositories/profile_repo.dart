// profile_repository.dart
import '../../data/models/profile_model.dart';
abstract class ProfileRepository {
  Future<ProfileModel> getProfile();

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
  });
}

