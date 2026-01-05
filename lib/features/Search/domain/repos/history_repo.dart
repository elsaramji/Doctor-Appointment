import 'package:round_7_mobile_cure_team4/features/Search/domain/entities/history_entity.dart';

abstract class HistoryRepo {
  Future<List<HistoryEntity?>> getHistory();
}
