import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/core/helper/api_constants.dart';
import 'package:round_7_mobile_cure_team4/core/helper/dio_helper.dart';

abstract class PostFavDocsRemoteSource {
  Future<String> postFavoriteDoctors(int id);
}

@LazySingleton(as: PostFavDocsRemoteSource)
class PostFavDocsRemoteSourceImp implements PostFavDocsRemoteSource {
  final DioHelper _dioHelper;

  const PostFavDocsRemoteSourceImp(this._dioHelper);

  @override
  Future<String> postFavoriteDoctors(int id) async {
    try {
      final response = await _dioHelper.postRequest(
        ApiConstant.makeFavoriteDoctors,
        {"doctorId": id},
      );

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return response?.data.toString() ?? 'Success';
      } else {
        throw Exception('Failed to post favorite doctor');
      }
    } catch (e) {
      rethrow;
    }
  }
}
