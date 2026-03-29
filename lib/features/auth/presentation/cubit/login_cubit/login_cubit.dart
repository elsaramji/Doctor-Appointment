import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/auth/domain/usecases/login_usecase.dart';

import 'login_state.dart';

@injectable
class LoginCubit extends Cubit<AuthState> {
  final LoginUseCase _useCase;
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginCubit(this._useCase) : super(AuthInitial());

  Future<void> login(String phoneNumber) async {
    emit(AuthLoading());
    final result = await _useCase.call(phoneNumber);
    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (response) => emit(AuthSuccess(response)),
    );
  }
}