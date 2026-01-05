import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/domain/Entities/allSpecialtiesEntity.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/domain/repo/all_specialties_repo.dart';

@injectable
class GetAllSpecialtiesUseCase {
  final AllSpecialtiesRepo _allSpecialtieRepo;

  const GetAllSpecialtiesUseCase(this._allSpecialtieRepo);

  Future<List<AllSpecialtiesEntity?>> call() async {
    return await _allSpecialtieRepo.getAllSpecialties();
  }
}
