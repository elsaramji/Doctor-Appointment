import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';


import '../../domain/usecases/add_payment_usecase.dart';
import 'add_payment_state.dart';

@injectable
class AddPaymentCubit extends Cubit<AddPaymentState> {
  final AddPaymentMethodUseCase addPaymentUseCase;

  AddPaymentCubit(this.addPaymentUseCase) : super(AddPaymentInitial());

  Future<void> addPayment(Map<String, dynamic> data, String token) async {
    emit(AddPaymentLoading());

    try {
      final result = await addPaymentUseCase(data, token);

      result.fold(
            (failure) => emit(AddPaymentError(message: failure.message)),
            (payment) => emit(AddPaymentSuccess(payment: payment)),
      );
    } catch (e) {
      emit(AddPaymentError(message: 'Unexpected error: $e'));
    }
  }
}

