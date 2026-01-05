import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/Search/domain/usecases/history_usecase.dart';
import 'package:round_7_mobile_cure_team4/features/Search/presentation/cubit/history_state.dart';

@injectable
class HistoryCubit extends Cubit<HistoryState> {
  final HistoryUsecase historyUsecase;
  HistoryCubit({required this.historyUsecase}) : super(HistoryInitState());

  Future<void> loadHistory() async {
    emit(HistoryLoadingState());
    try {
      final data = await historyUsecase.call();
      emit(HistoryLoadedState(history: data));
    } catch (e) {
      emit(HistoryErrorState(errorMSG: e.toString()));
    }
  }
}
