import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/add_review/data/datasources/add_review_remote_datasource.dart';
import 'package:round_7_mobile_cure_team4/features/add_review/data/models/add_review_request_model.dart';
import 'package:round_7_mobile_cure_team4/features/add_review/data/models/add_review_response_model.dart';
import 'package:round_7_mobile_cure_team4/features/add_review/domain/entities/add_review_request_entity.dart';
import 'package:round_7_mobile_cure_team4/features/add_review/domain/entities/add_review_response_entity.dart';
import 'package:round_7_mobile_cure_team4/features/add_review/domain/repositories/add_review_repo.dart';

@Injectable(as: AddReviewRepository)
class AddReviewRepositoryImpl implements AddReviewRepository {
  final AddReviewRemoteDatasource _datasource;

  const AddReviewRepositoryImpl(this._datasource);

  @override
  Future<AddReviewResponseEntity> addReview(
    AddReviewRequestEntity request,
  ) async {
    try {
      final requestModel = request.toModel();
      final responseModel = await _datasource.addReview(requestModel);
      return responseModel.toEntity();
    } catch (e, stackTrace) {
      log('❌ Error in makePayment: $e');
      log(stackTrace.toString());
      throw Exception('completed booking with the doctor to leave a review');
    }
  }
}
