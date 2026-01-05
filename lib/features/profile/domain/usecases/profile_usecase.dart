import 'package:injectable/injectable.dart';
import '../../data/models/profile_model.dart';
import '../repositories/profile_repo.dart';

@LazySingleton()
class GetProfileUseCase {
  final ProfileRepository repository;

  GetProfileUseCase(this.repository);

  Future<ProfileModel> call() async {
    return await repository.getProfile();
  }
}
