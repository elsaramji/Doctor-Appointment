import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/core/helper/api_constants.dart';
import 'package:round_7_mobile_cure_team4/core/helper/dio_helper.dart';
import 'package:round_7_mobile_cure_team4/features/Search/data/models/history_model.dart';

abstract class HistoryApiCall {
  Future<List<HistoryModel?>> getAllHistory();
}

@LazySingleton(as: HistoryApiCall)
class HistoryApiCallImp implements HistoryApiCall {
  final DioHelper _dioHelper;

  const HistoryApiCallImp(this._dioHelper);

  @override
  Future<List<HistoryModel?>> getAllHistory() async {
    final response = await _dioHelper.getRequest(ApiConstant.history);
    return docsFromJson(response?.data["data"]);
  }
}
