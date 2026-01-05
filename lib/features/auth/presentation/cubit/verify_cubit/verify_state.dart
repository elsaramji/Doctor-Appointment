import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:round_7_mobile_cure_team4/features/auth/domain/entities/verify_entity/verify_response_entity.dart';

part 'verify_state.freezed.dart';
@freezed
class VerifyState with _$VerifyState {
  const factory VerifyState.initial() = _Initial;

  const factory VerifyState.loginLoading() = _LoginLoading;

  const factory VerifyState.loginFailure(String message) = _LoginFailure;

  const factory VerifyState.loginSuccess({VerifyResponseEntity? response}) =
      _LoginSuccess;

  const factory VerifyState.signUpLoading() = _SignUpLoading;

  const factory VerifyState.signUpFailure(String message) = _SignUpFailure;

  const factory VerifyState.signUpSuccess({VerifyResponseEntity? response}) =
      _SignUpSuccess;

  // Timer state
  const factory VerifyState.timerUpdated(
    int secondsRemaining, {
    required bool canResend,
  }) = _TimerUpdated;
}
