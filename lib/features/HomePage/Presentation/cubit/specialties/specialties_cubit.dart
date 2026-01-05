import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/cubit/specialties/specialties_state.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/domain/useCases/get_all_specialties_usecase.dart';

@injectable
class SpecialtiesCubit extends Cubit<SpecialtiesStates> {
  final GetAllSpecialtiesUseCase allSpecialtiesUseCase;

  SpecialtiesCubit({required this.allSpecialtiesUseCase})
      : super(SpecialtiesInitialState());

  Future<void> loadAllSpecialties() async {
    emit(SpecialtiesLoadingState());
    try {
      final allSpecialties = await allSpecialtiesUseCase.call();
      emit(SpecialtiesLoadedState(specialties: allSpecialties));
    } catch (e) {
      emit(SpecialtiesErrorState(errorMSG: e.toString()));
    }
  }
}
