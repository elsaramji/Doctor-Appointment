import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/helper/api_constants.dart';
import '../../../../core/helper/dio_helper.dart';
import '../../domain/usecases/profile_usecase.dart';
import '../../domain/usecases/update_profile_usecase.dart';

import 'profile_state.dart';
@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;

  ProfileCubit({
    required this.getProfileUseCase,
    required this.updateProfileUseCase,
  }) : super(ProfileInitial());

  Future<void> fetchProfile() async {
    emit(ProfileLoading());
    try {
      final profile = await getProfileUseCase.call();
      emit(ProfileLoaded(profile));
    } catch (e) {
      emit(ProfileError('Failed to fetch profile'));
    }
  }
  final dioHelper = DioHelper();

  Future<void> updateProfile({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String address,
    required String birthDate,
    File? imgFile,
  }) async {
    emit(ProfileLoading());
    try {
      final formData = FormData.fromMap({
        'FullName': fullName,
        'Email': email,
        'PhoneNumber': phoneNumber,
        'Address': address,
        'BirthDate': birthDate,
        if (imgFile != null)
          'ProfileImage': await MultipartFile.fromFile(imgFile.path),
      });

      final response = await dioHelper.putRequest(
        ApiConstant.updateProfile,
        formData,
        headers: {
          'Content-Type': 'multipart/form-data',
        },
      );

      if (response != null && response.statusCode == 200) {
        emit(ProfileUpdateSuccess());
        await fetchProfile();
      } else {
        emit(ProfileUpdateFailure('Failed to update'));
      }
    } catch (e) {
      emit(ProfileUpdateFailure('Error: $e'));
    }
  }
}

