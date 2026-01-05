import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/domain/Entities/DoctorsEntity.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/domain/repo/all_doctors_repo.dart';

@injectable
class GetDoctorsNearYouUseCase {
  final DoctorsRepository _doctorsRepo;

  const GetDoctorsNearYouUseCase(this._doctorsRepo);

  Future<List<DoctorsEntity?>> call() async {
    return await _doctorsRepo.getNearestAllDoctor();
  }
}
