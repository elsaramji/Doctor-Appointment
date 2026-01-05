import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/cubit/favorite/favorite_state.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/domain/useCases/make_doctor_fav_usecase.dart';

@injectable
class FavoriteCubit extends Cubit<FavoriteStates> {
  final MakeDoctorFavUseCase makeFavUseCase;
  FavoriteCubit({required this.makeFavUseCase}) : super(FavInitialState());

  Future<void> makeFavorite(int doctorId) async {
    emit(FavLoadingState());
    try {
      final response = await makeFavUseCase.call(doctorId);
      emit(FavSuccessState(msg: response));
    } catch (e) {
      emit(FavErrorState(errorMSG: e.toString()));
    }
  }
}
