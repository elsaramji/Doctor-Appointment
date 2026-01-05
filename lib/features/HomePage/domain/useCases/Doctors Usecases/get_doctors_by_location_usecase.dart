import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/domain/Entities/DoctorsEntity.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/domain/repo/all_doctors_repo.dart';

@injectable
class GetDoctorsByLocationUseCase {
  final DoctorsRepository _doctorsRepo;

  const GetDoctorsByLocationUseCase(this._doctorsRepo);

  Future<List<DoctorsEntity?>> call(
    double latitude,
    double longitude,
    double? radiusKm,
  ) async {
    return await _doctorsRepo.getDoctorsByLocation(
      latitude,
      longitude,
      radiusKm,
    );
  }
}
