import '../../../data/models/auth_model.dart';

sealed class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final AuthModel response;
  AuthSuccess(this.response);
}

class AuthFailure extends AuthState {
  final String message;
  AuthFailure(this.message);
}
