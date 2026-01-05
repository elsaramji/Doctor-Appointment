import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/doctor_details/domain/entities/doctor_details_entity.dart';
import 'package:round_7_mobile_cure_team4/features/doctor_details/domain/usecases/doctor_details_usecase.dart';
import 'package:round_7_mobile_cure_team4/features/doctor_details/domain/usecases/get_available_slots_by_date_usecase.dart';
import 'doctor_details_state.dart';

@injectable
class DoctorDetailsCubit extends Cubit<DoctorDetailsState> {
  final GetDoctorDetailsUseCase _getDoctorDetailsUseCase;
  final GetAvailableSlotsByDateUseCase _getAvailableSlotsByDateUseCase;

  DoctorDetailsCubit(
      this._getDoctorDetailsUseCase,
      this._getAvailableSlotsByDateUseCase,
      ) : super(const DoctorDetailsState.initial());

  Future<void> getDoctorDetails(String doctorId) async {
    emit(const DoctorDetailsState.loading());

    try {
      final doctorDetails = await _getDoctorDetailsUseCase(doctorId);

      if (doctorDetails == null) {
        emit(const DoctorDetailsState.error(message: "Doctor details not found."));
        return;
      }

      final slotResult = _getAvailableSlotsByDateUseCase(
        doctorDetails.availableSlots.map((slot) => slot.toJson()).toList(),
      );
      print("Slots by Date: $slotResult");
      final List<String> dates = slotResult.keys.toList();

      emit(
        DoctorDetailsState.loaded(
          doctorDetails: doctorDetails,
          availableDates: dates,
          availableTimesByDate: slotResult,
        ),
      );
    } catch (e) {
      emit(DoctorDetailsState.error(
        message: "Failed to fetch doctor details: $e",
      ));
    }
  }
}
