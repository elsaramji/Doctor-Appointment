import 'package:equatable/equatable.dart';
import '../../domain/entities/payment_method.dart';

abstract class AddPaymentState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddPaymentInitial extends AddPaymentState {}

class AddPaymentLoading extends AddPaymentState {}

class AddPaymentSuccess extends AddPaymentState {
  final PaymentMethod payment;

  AddPaymentSuccess({required this.payment});

  @override
  List<Object?> get props => [payment];
}

class AddPaymentError extends AddPaymentState {
  final String message;

  AddPaymentError({required this.message});

  @override
  List<Object?> get props => [message];
}
