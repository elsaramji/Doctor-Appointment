import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/domain/Entities/DoctorsEntity.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/domain/repo/all_doctors_repo.dart';

@injectable
class GetAllSpecialityDoctorUseCase {
  final DoctorsRepository _doctorsRepo;

  const GetAllSpecialityDoctorUseCase(this._doctorsRepo);
  Future<List<DoctorsEntity?>> call(int specialityId) async {
    return await _doctorsRepo.getAllSpecialityDoctor(specialityId);
  }
}
