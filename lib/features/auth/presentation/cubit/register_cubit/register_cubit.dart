import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/auth/domain/usecases/register_usecase.dart';

import 'register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase _useCase;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isRememberMe = false;
  RegisterCubit(this._useCase) : super(RegisterInitial());

  Future<void> register({
    required String phoneNumber,
    required String name,
    required String email,
  }) async {
    emit(RegisterLoading());
    log("phone: $phoneNumber, name: $name, email: $email");
    final result = await _useCase.call(phoneNumber, name, email);
    log("result: ${result.toString()}");
    result.fold(
      (failure) => emit(RegisterFailure(failure.message)),
      (response) => emit(RegisterSuccess(response)),
    );
  }
}
