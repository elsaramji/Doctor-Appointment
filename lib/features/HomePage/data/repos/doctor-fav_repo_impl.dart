import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/data/data%20sources/post_fav_docs_remote_source.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/domain/repo/doctor__fav_repo.dart';

@LazySingleton(as: MakeDoctorFavRepo)
class MakeDoctorFavRepoImp implements MakeDoctorFavRepo {
  final PostFavDocsRemoteSource remoteSource;

  MakeDoctorFavRepoImp({required this.remoteSource});

  @override
  Future<String> makeDoctorFav(int id) async {
    try {
      return await remoteSource.postFavoriteDoctors(id);
    } catch (e) {
      throw Exception('Failed to make doctor favorite: $e');
    }
  }
}
