import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/doctor_details/domain/entities/doctor_details_entity.dart';
import 'package:round_7_mobile_cure_team4/features/pay/domain/usecases/payment_usecase.dart';
import 'pay_state.dart';
import 'package:round_7_mobile_cure_team4/features/pay/domain/entities/payment_request_entity.dart';

@injectable
class PaymentCubit extends Cubit<PaymentState> {
  final PaymentUseCase _useCase;

  PaymentCubit(this._useCase) : super(const PaymentState.initial());

  Future<void> _processPayment({
    required DoctorDetailsEntity doctor,
    required int slotId,
    required String appointmentAt,
    required int paymentMethod, // 0: PayPal, 1: Visa, 2: Cash
  }) async {
    emit(const PaymentState.loading());
    try {
      final paymentRequest = PaymentRequestEntity(
        doctorId: doctor.id,
        slotId: slotId,
        amount: doctor.pricePerHour,
        payment: paymentMethod,
        status: 0,
        appointmentAt: appointmentAt,
      );

      final response = await _useCase.call(paymentRequest);
      emit(PaymentState.success(response: response));
    } catch (e) {
      emit(PaymentState.error(message: e.toString()));
    }
  }

  Future<void> payWithCash({
    required DoctorDetailsEntity doctor,
    required int slotId,
    required String appointmentAt,
  }) async {
    await _processPayment(
      doctor: doctor,
      slotId: slotId,
      appointmentAt: appointmentAt,
      paymentMethod: 2,
    );
  }

  Future<void> payWithVisa({
    required DoctorDetailsEntity doctor,
    required int slotId,
    required String appointmentAt,
  }) async {
    await _processPayment(
      doctor: doctor,
      slotId: slotId,
      appointmentAt: appointmentAt,
      paymentMethod: 1,
    );
  }

  Future<void> payWithPayPal({
    required DoctorDetailsEntity doctor,
    required int slotId,
    required String appointmentAt,
  }) async {
    await _processPayment(
      doctor: doctor,
      slotId: slotId,
      appointmentAt: appointmentAt,
      paymentMethod: 0,
    );
  }
}
