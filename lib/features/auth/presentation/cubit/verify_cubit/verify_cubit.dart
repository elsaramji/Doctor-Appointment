import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:round_7_mobile_cure_team4/features/auth/presentation/cubit/verify_cubit/verify_state.dart';

import '../../../domain/usecases/verify_otp_usecase.dart';

class VerifyCubit extends Cubit<VerifyState> {
  final VerifyLoginUseCase verifyLoginUseCase;
  final VerifySignUpUseCase verifySignUpUseCase;

  Timer? _timer;
  int _secondsRemaining = 60;

  VerifyCubit({
    required this.verifyLoginUseCase,
    required this.verifySignUpUseCase,
  }) : super(VerifyInitial());

  // 🔹 Start OTP Timer
  void startOtpTimer() {
    _timer?.cancel();
    _secondsRemaining = 60;
    emit(VerifyTimerUpdated(_secondsRemaining, canResend: false));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _secondsRemaining--;
      if (_secondsRemaining <= 0) {
        timer.cancel();
        emit(VerifyTimerUpdated(0, canResend: true));
      } else {
        emit(VerifyTimerUpdated(_secondsRemaining, canResend: false));
      }
    });
  }

  // 🔹 Verify Login OTP
  Future<void> verifyLoginOtp(String phoneNumber, String otp) async {
    emit(VerifyLoading());
    final result = await verifyLoginUseCase(phoneNumber, otp);
    result.fold(
      (failure) => emit(VerifyFailure(failure.message)),
      (success) => emit(VerifySuccess(success.data!.token)),
    );
  }

  // 🔹 Verify Sign Up OTP
  Future<void> verifySignUpOtp(
    String phoneNumber,
    String otp,
    String email,
  ) async {
    emit(VerifyLoading());

    final result = await verifySignUpUseCase(phoneNumber, otp, email);

    result.fold(
      (failure) => emit(VerifyFailure(failure.message)),
      (success) => emit(VerifySuccess(success.data!.token)),
    );
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
