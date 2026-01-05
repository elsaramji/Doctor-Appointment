import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/domain/repo/doctor__fav_repo.dart';

@injectable
class MakeDoctorFavUseCase {
  final MakeDoctorFavRepo _favRepo;

  const MakeDoctorFavUseCase(this._favRepo);

  Future<String> call(int id) async {
    return await _favRepo.makeDoctorFav(id);
  }
}
