import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/Search/data/data%20sources/history_api_call.dart';
import 'package:round_7_mobile_cure_team4/features/Search/domain/entities/history_entity.dart';
import 'package:round_7_mobile_cure_team4/features/Search/domain/repos/history_repo.dart';

@LazySingleton(as: HistoryRepo)
class HistoryRepoImp extends HistoryRepo {
  final HistoryApiCall historyApiCall;

  HistoryRepoImp({required this.historyApiCall});

  @override
  Future<List<HistoryEntity?>> getHistory() async {
    try {
      return await historyApiCall.getAllHistory();
    } catch (e) {
      throw Exception('Failed to fetch History: $e');
    }
  }
}
