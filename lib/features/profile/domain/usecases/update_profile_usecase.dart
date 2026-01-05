import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/core/helper/token_storage.dart';
import 'package:round_7_mobile_cure_team4/features/profile/domain/repositories/profile_repo.dart';

@LazySingleton()
class UpdateProfileUseCase {
  final ProfileRepository repository;
  final TokenStorage _tokenStorage;

  UpdateProfileUseCase(this.repository, this._tokenStorage);

  Future<bool> call({
    required String name,
    required String email,
    required String phone,
    required String address,
    required String birthDate,
    String? imgFile,
    double? latitude,
    double? longitude,
  }) async {
    final token = await _tokenStorage.getAccessToken();
    if (token == null) throw Exception("User not authenticated");

    return await repository.updateProfile(
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
