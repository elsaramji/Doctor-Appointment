import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/core/helper/api_constants.dart';
import 'package:round_7_mobile_cure_team4/core/helper/dio_helper.dart';
import 'package:round_7_mobile_cure_team4/features/doctor_details/data/models/doctor_model.dart';

@LazySingleton()
class DoctorDetailsApiCall {
  final DioHelper _dio;

  const DoctorDetailsApiCall(this._dio);

  Future<Doctor> apiCall(String id) async {
    try {
      final response = await _dio.getRequest(
        "${ApiConstant.doctorDetailsEndPoint}/$id",
      );
      return Doctor.fromJson(response?.data['data']);
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    }
  }
}
