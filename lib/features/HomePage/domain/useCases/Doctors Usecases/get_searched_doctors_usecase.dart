import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/domain/Entities/DoctorsEntity.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/domain/repo/all_doctors_repo.dart';

@injectable
class GetSearchedDoctorsUsecase {
  final DoctorsRepository _doctorsRepo;

  const GetSearchedDoctorsUsecase(this._doctorsRepo);

  Future<List<DoctorsEntity?>> call(String keyword) async {
    return await _doctorsRepo.getSearchedDoctors(keyword);
  }
}
