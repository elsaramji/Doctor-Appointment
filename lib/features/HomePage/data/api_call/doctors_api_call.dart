import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/core/helper/api_constants.dart';
import 'package:round_7_mobile_cure_team4/core/helper/dio_helper.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/data/models/allDoctorsModel.dart';

@LazySingleton()
class DoctorsApi {
  final DioHelper _dioHelper;

  const DoctorsApi(this._dioHelper);

  Future<List<DoctorsModel>> fetchAllDoctors() async {
    final response = await _dioHelper.getRequest(ApiConstant.allDoctors);
    final rawData = response?.data['data'];
    if (rawData == null || rawData is! List) return [];
    return docsFromJson(rawData);
  }

  Future<List<DoctorsModel?>> fetchNearestDoctors() async {
    final response = await _dioHelper.getRequest(ApiConstant.doctorNearYou);
    final rawData = response?.data['data'];
    if (rawData == null || rawData is! List) return [];
    return docsFromJson(rawData);
  }

  Future<List<DoctorsModel?>> fetchFavoriteDoctors() async {
    final response = await _dioHelper.getRequest(ApiConstant.favoriteDoctors);
    final data = response?.data['data'];
    return docsFromJson(data);
  }
  
   Future<List<DoctorsModel?>> fetchTopDoctors() async {
    final response = await _dioHelper.getRequest(ApiConstant.topDoctors);
    final data = response?.data['data'];
    return docsFromJson(data);
  }


  Future<List<DoctorsModel?>> fetchAllSpecialityDoctor(int specialityId) async {
    final response = await _dioHelper.getRequest(
      "${ApiConstant.Specialty}/$specialityId",
    );
    final rawData = response?.data['data'];
    if (rawData == null || rawData is! List) return [];
    return docsFromJson(rawData);
  }

  Future<List<DoctorsModel?>> fetchDoctorByLocation(
    double latitude,
    double longitude,
    double radiusKm,
  ) async {
    final response = await _dioHelper.getRequest(
      ApiConstant.searchByLocation,
      queryParameters: {
        'latitude': latitude,
        'longitude': longitude,
        'radiusKm': radiusKm,
      },
    );
    final data = response?.data['data'];
    return docsFromJson(data);
  }
}
