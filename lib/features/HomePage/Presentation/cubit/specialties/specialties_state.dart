import 'package:equatable/equatable.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/domain/Entities/allSpecialtiesEntity.dart';

abstract class SpecialtiesStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class SpecialtiesInitialState extends SpecialtiesStates {}

class SpecialtiesLoadingState extends SpecialtiesStates {}

class SpecialtiesLoadedState extends SpecialtiesStates {
  final List<AllSpecialtiesEntity?> specialties;

  SpecialtiesLoadedState({required this.specialties});

  @override
  List<Object?> get props => [specialties];
}

class SpecialtiesErrorState extends SpecialtiesStates {
  final String errorMSG;

  SpecialtiesErrorState({required this.errorMSG});

  @override
  List<Object?> get props => [errorMSG];
}
