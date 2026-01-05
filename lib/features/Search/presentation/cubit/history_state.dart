import 'package:equatable/equatable.dart';
import 'package:round_7_mobile_cure_team4/features/Search/domain/entities/history_entity.dart';

abstract class HistoryState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HistoryInitState extends HistoryState {}

class HistoryLoadingState extends HistoryState {}

class HistoryLoadedState extends HistoryState {
  final List<HistoryEntity?> history;
  HistoryLoadedState({required this.history});

  @override
  // TODO: implement props
  List<Object?> get props => [history];
}

class HistoryErrorState extends HistoryState {
  final String errorMSG;

  HistoryErrorState({required this.errorMSG});

  @override
  List<Object?> get props => [errorMSG];
}
