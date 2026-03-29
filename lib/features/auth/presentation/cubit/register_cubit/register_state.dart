import '../../../data/models/auth_model.dart';

sealed class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final AuthModel response;
  RegisterSuccess(this.response);
}

class RegisterFailure extends RegisterState {
  final String message;
  RegisterFailure(this.message);
}
