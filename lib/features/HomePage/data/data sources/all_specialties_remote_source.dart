import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/core/helper/dio_helper.dart';
import 'package:round_7_mobile_cure_team4/core/helper/api_constants.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/data/models/allSpecialtiesModel.dart';

abstract class AllSpecialtiesRemoteSource {
  Future<List<AllSpecialtiesModel>> getAllSpecialties();
}

@LazySingleton(as: AllSpecialtiesRemoteSource)
class AllSpecialtiesRemoteSourceImp implements AllSpecialtiesRemoteSource {
  final DioHelper _dioHelper;

  const AllSpecialtiesRemoteSourceImp(this._dioHelper);

  @override
  Future<List<AllSpecialtiesModel>> getAllSpecialties() async {
    try {
      final response = await _dioHelper.getRequest(ApiConstant.allSpecialties);
      final rawData = response?.data['data'];
      if (rawData == null || rawData is! List) return [];
      return specialtiesFromJson(rawData);
    } catch (e) {
      throw Exception('Failed to fetch all specialties: $e');
    }
  }
}
