import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/doctor_details/domain/entities/doctor_details_entity.dart';
import 'package:round_7_mobile_cure_team4/features/doctor_details/domain/repositories/doctor_details_repo.dart';

@injectable
class GetDoctorDetailsUseCase {
  final DoctorDetailsRepo _doctorRepository;

  const GetDoctorDetailsUseCase(this._doctorRepository);

  Future<DoctorDetailsEntity?> call(String id) {
    return _doctorRepository.getDoctorDetails(id);
  }
}
