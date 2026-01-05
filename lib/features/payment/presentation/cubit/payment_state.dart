import 'package:equatable/equatable.dart';
import '../../domain/entities/payment_method.dart';
abstract class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object?> get props => [];
}

class PaymentInitial extends PaymentState {}

class PaymentLoading extends PaymentState {}

class PaymentLoaded extends PaymentState {
  final List<PaymentMethod> payments;
  const PaymentLoaded({required this.payments});

  @override
  List<Object?> get props => [payments];
}

class PaymentError extends PaymentState {
  final String message;
  const PaymentError({required this.message});

  @override
  List<Object?> get props => [message];
}
