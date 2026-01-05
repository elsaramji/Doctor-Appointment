import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/Search/domain/entities/history_entity.dart';
import 'package:round_7_mobile_cure_team4/features/Search/domain/repos/history_repo.dart';

@injectable
class HistoryUsecase {
  final HistoryRepo _historyRepo;

  const HistoryUsecase(this._historyRepo);

  Future<List<HistoryEntity?>> call() async {
    return await _historyRepo.getHistory();
  }
}
