import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/core/helper/api_constants.dart';
import '../models/profile_model.dart';
import '../../../../core/helper/dio_helper.dart';


@LazySingleton()
class ProfileRemoteDataSource {
  final DioHelper dioHelper;

  ProfileRemoteDataSource(this.dioHelper);

  Future<ProfileModel> getProfile() async {
    try {
      final response = await dioHelper.getRequest(
        ApiConstant.getProfile,
      );

      if (response == null) {
        throw Exception('No response from server');
      }

      if (response.statusCode == 200) {
        final json = response.data as Map<String, dynamic>;

        if (json['success'] == true) {
          final data = json['data'];
          if (data == null) throw Exception('Profile data is null');
          return ProfileModel.fromJson(Map<String, dynamic>.from(data));

        } else {
          final message = json['message'] ?? 'Unknown error';
          throw Exception(message);
        }
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      print('Dio Error: ${e.message}');
      throw Exception(e.response?.data['message'] ?? 'Network error');
    } catch (e) {
      print('Unexpected error: $e');
      throw Exception('Failed to fetch profile');
    }
  }



  Future<bool> updateProfile({
    required String name,
    required String email,
    required String phone,
    required String address,
    required String birthDate,
    String? imgFile,
    double? latitude,
    double? longitude,
    String? token,
  }) async {
    final data = {
      "FullName": name,
      "Email": email,
      "PhoneNumber": phone,
      "Address": address,
      "BirthDate": birthDate,
      if (imgFile != null) "ImgFile": imgFile,
      if (latitude != null) "Latitude": latitude,
      if (longitude != null) "Longitude": longitude,
    };

    final response = await dioHelper.putRequest(
      ApiConstant.updateProfile,
      data,
    );

    if (response != null &&
        response.statusCode == 200 &&
        response.data['data'] != null) {
      return true;
    } else {
      print('Update profile failed: ${response?.data}');
      return false;
    }
  }


}
