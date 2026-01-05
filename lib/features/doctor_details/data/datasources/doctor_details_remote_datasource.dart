import 'package:round_7_mobile_cure_team4/features/doctor_details/data/models/doctor_model.dart';

abstract class DoctorDetailsRemoteDataSource {
  Future<Doctor> getDoctorDetails(String doctorId);
}
