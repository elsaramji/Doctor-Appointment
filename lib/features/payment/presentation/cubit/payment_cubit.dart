import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/core/helper/token_storage.dart';
import 'package:round_7_mobile_cure_team4/features/payment/domain/usecases/get_payment_methos_usecase.dart';
import 'package:round_7_mobile_cure_team4/features/payment/presentation/cubit/payment_state.dart';

@injectable
class PaymentCubit2 extends Cubit<PaymentState> {
  final GetPaymentMethods getPaymentMethodsUseCase;
  final TokenStorage _tokenStorage;

  PaymentCubit2(this.getPaymentMethodsUseCase, this._tokenStorage)
      : super(PaymentInitial());

  Future<void> fetchPayments() async {
    emit(PaymentLoading());

    try {
      final token = await _tokenStorage.getAccessToken();
      if (token == null) {
        emit(PaymentError(message: "No access token found"));
        return;
      }

      final result = await getPaymentMethodsUseCase(token);

      result.fold(
            (failure) => emit(PaymentError(message: failure.message)),
            (payments) => emit(PaymentLoaded(payments: payments)),
      );
    } catch (e) {
      emit(PaymentError(message: e.toString()));
    }
  }
}
