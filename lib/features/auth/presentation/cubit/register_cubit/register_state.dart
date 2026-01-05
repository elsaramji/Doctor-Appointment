import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:round_7_mobile_cure_team4/features/auth/domain/entities/auth_response.dart';

part 'register_state.freezed.dart';

@freezed
abstract class RegisterState with _$RegisterState {
  const factory RegisterState.initial({
    @Default(false) bool isRememberMe,
  }) = _RegisterInitial;

  const factory RegisterState.loading({
    @Default(false) bool isRememberMe,
  }) = _RegisterLoading;

  const factory RegisterState.success({
    required AuthResponseEntity response,
    @Default(false) bool isRememberMe,
  }) = _RegisterSuccess;

  const factory RegisterState.failure({
    required String message,
    @Default(false) bool isRememberMe,
  }) = _RegisterFailure;
}
