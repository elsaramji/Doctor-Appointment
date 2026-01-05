import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/data/data%20sources/all_doctors_remote_source.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/domain/Entities/DoctorsEntity.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/domain/repo/all_doctors_repo.dart';

@LazySingleton(as: DoctorsRepository)
class DoctorsRepoImp implements DoctorsRepository {
  final DoctorsRemoteSource remoteSource;

  DoctorsRepoImp({required this.remoteSource});

  @override
  Future<List<DoctorsEntity?>> getAllDoctor() async {
    try {
      return await remoteSource.getAllDoctors();
    } catch (e) {
      throw Exception('Failed to fetch all doctors: $e');
    }
  }

  @override
  Future<List<DoctorsEntity?>> getSearchedDoctors(String keyword) async {
    try {
      return await remoteSource.getSearchDocs(keyword);
    } catch (e) {
      throw Exception('Failed to fetch Searched doctors: $e');
    }
  }

  @override
  Future<List<DoctorsEntity?>> getNearestAllDoctor() async {
    try {
      return await remoteSource.getNearestDoctors();
    } catch (e) {
      throw Exception('Failed to fetch nearest doctors: $e');
    }
  }

  @override
  Future<List<DoctorsEntity?>> getAllSpecialityDoctor(int specialityId) async {
    try {
      return await remoteSource.getAllSpecialityDoctor(specialityId);
    } catch (e) {
      throw Exception('Failed to fetch specialty doctors: $e');
    }
  }

  @override
  Future<List<DoctorsEntity?>> getFavDoctors() async {
    try {
      return await remoteSource.getFavoriteDoctors();
    } catch (e) {
      throw Exception('Failed to fetch favorite doctors: $e');
    }
  }

  @override
  Future<List<DoctorsEntity?>> getRatedDoctors() async {
    try {
      return await remoteSource.getTopDoctors();
    } catch (e) {
      throw Exception('Failed to fetch top rated doctors: $e');
    }
  }

  @override
  Future<List<DoctorsEntity?>> getDoctorsByLocation(
    double latitude,
    double longitude,
    double? radiusKm,
  ) async {
    try {
      return await remoteSource.getDoctorByLocation(
        latitude,
        longitude,
        radiusKm,
      );
    } catch (e) {
      throw Exception('Failed to fetch doctors by location: $e');
    }
  }
}
