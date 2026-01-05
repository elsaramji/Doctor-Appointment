import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/domain/Entities/DoctorsEntity.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/domain/repo/all_doctors_repo.dart';

@injectable
class GetFavsDoctorsUseCase {
  final DoctorsRepository _doctorsRepo;

  const GetFavsDoctorsUseCase(this._doctorsRepo);

  Future<List<DoctorsEntity?>> call() async {
    return await _doctorsRepo.getFavDoctors();
  }
}
