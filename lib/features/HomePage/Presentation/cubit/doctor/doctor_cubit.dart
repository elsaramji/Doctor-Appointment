import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/cubit/doctor/doctor_state.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/domain/useCases/Doctors Usecases/get_all_doctors_usecase.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/domain/useCases/Doctors Usecases/get_all_speciality_doctor_usecase.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/domain/useCases/Doctors Usecases/get_doctors_by_location_usecase.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/domain/useCases/Doctors Usecases/get_doctors_near_you_usecase.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/domain/useCases/Doctors Usecases/get_fav_doctors_usecase.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/domain/useCases/Doctors%20Usecases/get_searched_doctors_usecase.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/domain/useCases/Doctors%20Usecases/get_top_rated_doctors.dart';

@injectable
class DoctorsCubit extends Cubit<DoctorsStates> {
  final GetAllDoctorsUseCase allDoctors;
  final GetDoctorsNearYouUseCase nearsDoctors;
  final GetAllSpecialityDoctorUseCase specialityDoctors;
  final GetDoctorsByLocationUseCase doctorsByLocation;
  final GetFavsDoctorsUseCase favsDoctors;
  final GetTopRatedDoctorsUsecae topDocs;
  final GetSearchedDoctorsUsecase searchedDocs;

  DoctorsCubit({
    required this.allDoctors,
    required this.nearsDoctors,
    required this.specialityDoctors,
    required this.favsDoctors,
    required this.doctorsByLocation,
    required this.topDocs,
    required this.searchedDocs,
  }) : super(InitialState());

  // ==============================
  // ===== Methods Instead of Events
  // ==============================

  Future<void> loadAllDoctors() async {
    emit(LoadingState());
    try {
      final data = await allDoctors.call();
      emit(LoadedState(doctors: data));
    } catch (e) {
      emit(ErrorState(errorMSG: e.toString()));
    }
  }

  Future<void> loadNearDoctors() async {
    emit(LoadingState());
    try {
      final data = await nearsDoctors.call();
      emit(LoadedState(doctors: data));
    } catch (e) {
      emit(ErrorState(errorMSG: e.toString()));
    }
  }

  Future<void> loadSpecialityDoctors(int specialityId) async {
    emit(LoadingState());
    try {
      final data = await specialityDoctors.call(specialityId);
      emit(LoadedState(doctors: data));
    } catch (e) {
      emit(ErrorState(errorMSG: e.toString()));
    }
  }

  Future<void> loadSearchedDoctors(String keyword) async {
    emit(LoadingState());
    try {
      final data = await searchedDocs.call(keyword);
      if (data.isEmpty) {
        emit(ErrorState(errorMSG: "No doctors found matching the keyword."));
      }
      emit(LoadedState(doctors: data));
    } catch (e) {
      emit(ErrorState(errorMSG: e.toString()));
    }
  }

  Future<void> getFavDoctors() async {
    emit(LoadingState());
    try {
      final data = await favsDoctors.call();
      emit(LoadedState(doctors: data));
    } catch (e) {
      emit(ErrorState(errorMSG: e.toString()));
    }
  }

  Future<void> getTopRatedDoctors() async {
    emit(LoadingState());
    try {
      final data = await topDocs.call();
      emit(LoadedState(doctors: data));
    } catch (e) {
      emit(ErrorState(errorMSG: e.toString()));
    }
  }

  Future<void> getDoctorsByLocation(
    double lat,
    double lng,
    double? radiusKm,
  ) async {
    emit(LoadingState());
    try {
      final data = await doctorsByLocation.call(lat, lng, radiusKm);
      emit(LoadedState(doctors: data));
    } catch (e) {
      emit(ErrorState(errorMSG: e.toString()));
    }
  }
}
