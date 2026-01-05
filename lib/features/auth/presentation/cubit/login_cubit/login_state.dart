import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:round_7_mobile_cure_team4/features/auth/domain/entities/auth_response.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState.initial() = LoginStateInitial;

  const factory LoginState.loading() = LoginStateLoading;

  const factory LoginState.success({
    required AuthResponseEntity response,
  }) = LoginStateSuccess;

  const factory LoginState.failure({
    required String message,
  }) = LoginStateFailure;
}
