import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/core/helper/api_constants.dart';
import 'package:round_7_mobile_cure_team4/core/helper/dio_helper.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/data/models/allDoctorsModel.dart';

abstract class DoctorsRemoteSource {
  Future<List<DoctorsModel?>> getAllDoctors();
  Future<List<DoctorsModel?>> getNearestDoctors();
  Future<List<DoctorsModel?>> getFavoriteDoctors();
  Future<List<DoctorsModel?>> getTopDoctors();
  Future<List<DoctorsModel?>> getSearchDocs(String keyword);
  Future<List<DoctorsModel?>> getAllSpecialityDoctor(int specialityId);
  Future<List<DoctorsModel?>> getDoctorByLocation(
    double latitude,
    double longitude,
    double? radiusKm,
  );
}

@LazySingleton(as: DoctorsRemoteSource)
class DoctorsRemoteSourceImp implements DoctorsRemoteSource {
  final DioHelper _dioHelper;

  const DoctorsRemoteSourceImp(this._dioHelper);

  @override
  Future<List<DoctorsModel?>> getAllDoctors() async {
    final response = await _dioHelper.getRequest(ApiConstant.allDoctors);
    return docsFromJson(response?.data['data']);
  }

  @override
  Future<List<DoctorsModel?>> getNearestDoctors() async {
    final response = await _dioHelper.getRequest(ApiConstant.doctorNearYou);
    return docsFromJson(response?.data['data']);
  }

  @override
  Future<List<DoctorsModel?>> getFavoriteDoctors() async {
    final response = await _dioHelper.getRequest(ApiConstant.favoriteDoctors);
    return docsFromJson(response?.data['data']);
  }

  /////!SECTION
  @override
  Future<List<DoctorsModel>> getSearchDocs(String keyword) async {
    final response = await _dioHelper.postRequest(ApiConstant.searchAboutDocs, {
      "keyword": keyword,
    });
    final data = response?.data['data'];
    if (data == null || data['doctors'] == null) {
      return [];
    } else {
      return docsFromJson(data['doctors'] as List);
    }
  }

  ////////
  @override
  Future<List<DoctorsModel?>> getTopDoctors() async {
    final response = await _dioHelper.getRequest(ApiConstant.topDoctors);
    return docsFromJson(response?.data['data']);
  }

  @override
  Future<List<DoctorsModel?>> getAllSpecialityDoctor(int specialityId) async {
    final response = await _dioHelper.getRequest(
      "${ApiConstant.Specialty}/$specialityId",
    );
    return docsFromJson(response?.data['data']);
  }

  @override
  Future<List<DoctorsModel?>> getDoctorByLocation(
    double latitude,
    double longitude,
    double? radiusKm,
  ) async {
    final response = await _dioHelper.getRequest(
      ApiConstant.searchByLocation,
      queryParameters: {
        'latitude': latitude,
        'longitude': longitude,
        'radiusKm': radiusKm,
      },
    );
    return docsFromJson(response?.data['data']);
  }
}
