import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/auth/domain/entities/verify_entity/verify_request_entity.dart';
import 'package:round_7_mobile_cure_team4/features/auth/domain/usecases/verify_otp_usecase.dart';
import 'verify_state.dart';

@injectable
class VerifyCubit extends Cubit<VerifyState> {
  final VerifyLoginUseCase verifyLoginUseCase;
  final VerifySignUpUseCase verifySignUpUseCase;

  Timer? _timer;
  int _secondsRemaining = 60;

  VerifyCubit({
    required this.verifyLoginUseCase,
    required this.verifySignUpUseCase,
  }) : super(const VerifyState.initial());

  // 🔹 Start OTP Timer
  void startOtpTimer() {
    _timer?.cancel();
    _secondsRemaining = 60;
    emit(VerifyState.timerUpdated(_secondsRemaining, canResend: false));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _secondsRemaining--;
      if (_secondsRemaining <= 0) {
        timer.cancel();
        emit(VerifyState.timerUpdated(0, canResend: true));
      } else {
        emit(VerifyState.timerUpdated(_secondsRemaining, canResend: false));
      }
    });
  }

  // 🔹 Verify Login OTP
  Future<void> verifyLoginOtp(VerifyRequestEntity request) async {
    emit(const VerifyState.loginLoading());

    final result = await verifyLoginUseCase(request);

    result.fold(
          (failure) => emit(VerifyState.loginFailure(failure.message)),
          (success) => emit(VerifyState.loginSuccess(response: success)),
    );
  }

  // 🔹 Verify Sign Up OTP
  Future<void> verifySignUpOtp(VerifyRequestEntity request) async {
    emit(const VerifyState.signUpLoading());

    final result = await verifySignUpUseCase(request);

    result.fold(
          (failure) => emit(VerifyState.signUpFailure(failure.message)),
          (success) => emit(VerifyState.signUpSuccess(response: success)),
    );
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
