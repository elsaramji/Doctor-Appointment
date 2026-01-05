import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/doctor_details/data/api_call/doctor_details_api_call.dart';
import 'package:round_7_mobile_cure_team4/features/doctor_details/data/datasources/doctor_details_remote_datasource.dart';
import 'package:round_7_mobile_cure_team4/features/doctor_details/data/models/doctor_model.dart';

@LazySingleton(as: DoctorDetailsRemoteDataSource)
class DoctorDetailsRemoteDataSourceImpl
    implements DoctorDetailsRemoteDataSource {
  final DoctorDetailsApiCall _doctorDetailsApiCall;

  const DoctorDetailsRemoteDataSourceImpl(this._doctorDetailsApiCall);

  @override
  Future<Doctor> getDoctorDetails(String doctorId) async {
    try {
      final result = await _doctorDetailsApiCall.apiCall(doctorId);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
