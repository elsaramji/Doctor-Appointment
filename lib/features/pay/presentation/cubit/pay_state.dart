import 'package:round_7_mobile_cure_team4/features/pay/domain/entities/payment_response_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pay_state.freezed.dart';

@freezed
abstract class PaymentState with _$PaymentState {
  const factory PaymentState.initial() = _Initial;
  const factory PaymentState.loading() = _Loading;
  const factory PaymentState.success({required PaymentResponseEntity response}) = _Success;
  const factory PaymentState.error({required String message}) = _Error;
}
