import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/auth/domain/entities/register_entity.dart';
import 'package:round_7_mobile_cure_team4/features/auth/domain/usecases/register_usecase.dart';

import 'register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase _registerUseCase;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RegisterCubit(this._registerUseCase) : super(const RegisterState.initial());

  void toggleRememberMe(bool value) {
    emit(
      state.map(
        initial: (s) => s.copyWith(isRememberMe: value),
        loading: (s) => s.copyWith(isRememberMe: value),
        success: (s) => s.copyWith(isRememberMe: value),
        failure: (s) => s.copyWith(isRememberMe: value),
      ),
    );
  }


  Future<void> register() async {
    emit(RegisterState.loading(isRememberMe: state.isRememberMe));

    final request = RegisterRequestEntity(
      fullName: nameController.text,
      phoneNumber: phoneController.text,
      email: emailController.text,
    );

    final result = await _registerUseCase(request);

    result.fold(
      (failure) => emit(
        RegisterState.failure(
          message: failure.message,
          isRememberMe: state.isRememberMe,
        ),
      ),
      (response) => emit(
        RegisterState.success(
          response: response,
          isRememberMe: state.isRememberMe,
        ),
      ),
    );
  }
}
