import 'package:round_7_mobile_cure_team4/features/doctor_details/domain/entities/doctor_details_entity.dart';

abstract class DoctorDetailsRepo {
  Future<DoctorDetailsEntity?> getDoctorDetails(String id);
}