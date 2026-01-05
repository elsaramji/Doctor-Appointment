import 'package:equatable/equatable.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/domain/Entities/DoctorsEntity.dart';

abstract class DoctorsStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends DoctorsStates {}

class LoadingState extends DoctorsStates {}

class LoadedState extends DoctorsStates {
  final List<DoctorsEntity?> doctors;

  LoadedState({required this.doctors});

  @override
  List<Object?> get props => [doctors];
}

class ErrorState extends DoctorsStates {
  final String errorMSG;

  ErrorState({required this.errorMSG});

  @override
  List<Object?> get props => [errorMSG];
}
