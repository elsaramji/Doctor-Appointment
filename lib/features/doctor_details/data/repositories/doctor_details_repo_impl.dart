import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/doctor_details/data/datasources/doctor_details_remote_datasource.dart';
import 'package:round_7_mobile_cure_team4/features/doctor_details/domain/entities/doctor_details_entity.dart';
import 'package:round_7_mobile_cure_team4/features/doctor_details/domain/repositories/doctor_details_repo.dart';
import 'package:round_7_mobile_cure_team4/features/doctor_details/data/models/doctor_model.dart';

@Injectable(as: DoctorDetailsRepo)
class DoctorDetailsRepoImpl implements DoctorDetailsRepo {
  final DoctorDetailsRemoteDataSource _doctorDetailsDataSource;

  const DoctorDetailsRepoImpl(this._doctorDetailsDataSource);

  @override
  Future<DoctorDetailsEntity?> getDoctorDetails(String id) async {
    try {
      final responseModel = await _doctorDetailsDataSource.getDoctorDetails(id);

      final responseEntity = responseModel.toEntity();

      return responseEntity;
    } catch (e, stackTrace) {
      log('❌ Error in getTopHeadlines: $e');
      log(stackTrace.toString());
      throw Exception('Failed to fetch top headlines');
    }
  }
}
