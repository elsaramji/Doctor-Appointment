import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/core/helper/api_constants.dart';
import 'package:round_7_mobile_cure_team4/core/helper/dio_helper.dart';
import 'package:round_7_mobile_cure_team4/features/booking/data/models/booking_search/booking_search_model.dart';
import 'package:round_7_mobile_cure_team4/features/booking/data/models/reschedule/reschedule_model.dart';

@LazySingleton()
class BookingSearchApiCall {
  final DioHelper _dio;

  const BookingSearchApiCall(this._dio);

  Future<List<BookingSearchModel>> apiCall(String fromDate) async {
    try {
      final response = await _dio.getRequest(
        "${ApiConstant.bookingSearchEndPoint}?FromDate=$fromDate",
      );

      if (response?.data['data'] != null) {
        final List<dynamic> dataList = response!.data['data'] as List<dynamic>;
        return dataList
            .map(
              (json) =>
                  BookingSearchModel.fromJson(json as Map<String, dynamic>),
            )
            .toList();
      }
      return [];
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    }
  }

  Future<RescheduleResponse> apiCallReschedule({
    required String id,
    required String newDateTime,
  }) async {
    try {
      final response = await _dio.putRequest(
        "${ApiConstant.bookingRescheduleEndPoint}/$id",
        jsonEncode(newDateTime),
      );

      if (response?.statusCode == 200) {
        return RescheduleResponse.fromJson(response!.data);
      } else {
        return RescheduleResponse(
          success: false,
          message: response?.data['message'] ?? 'Failed to reschedule',
        );
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    }
  }

  Future<RescheduleResponse> apiCallCancel({required String id}) async {
    try {
      final response = await _dio.putRequest(
        "${ApiConstant.bookingCancelEndPoint}/$id",
        null,
      );

      if (response?.statusCode == 200) {
        return RescheduleResponse.fromJson(response!.data);
      } else {
        return RescheduleResponse(
          success: false,
          message: response?.data['message'] ?? 'Failed to Cancel',
        );
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    }
  }
}
