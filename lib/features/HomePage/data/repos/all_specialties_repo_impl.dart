import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/data/data%20sources/all_specialties_remote_source.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/domain/Entities/allSpecialtiesEntity.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/domain/repo/all_specialties_repo.dart';

@LazySingleton(as: AllSpecialtiesRepo)
class AllSpecialtiesRepoImp implements AllSpecialtiesRepo {
  final AllSpecialtiesRemoteSource remoteSource;

  AllSpecialtiesRepoImp({required this.remoteSource});

  @override
  Future<List<AllSpecialtiesEntity?>> getAllSpecialties() async {
    try {
      return await remoteSource.getAllSpecialties();
    } catch (e) {
      throw Exception('Failed to fetch all specialties: $e');
    }
  }
}
