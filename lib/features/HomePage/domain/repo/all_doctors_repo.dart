import 'package:round_7_mobile_cure_team4/features/HomePage/domain/Entities/DoctorsEntity.dart';

abstract class DoctorsRepository {
  Future<List<DoctorsEntity?>> getAllDoctor();
  Future<List<DoctorsEntity?>> getNearestAllDoctor();
  Future<List<DoctorsEntity?>> getAllSpecialityDoctor(int specialityId);
  Future<List<DoctorsEntity?>> getFavDoctors();
  Future<List<DoctorsEntity?>> getRatedDoctors();
  Future<List<DoctorsEntity?>> getSearchedDoctors(String keyword);
  Future<List<DoctorsEntity?>> getDoctorsByLocation(
    double latitude,
    double longitude,
    double? radiusKm,
  );
}
