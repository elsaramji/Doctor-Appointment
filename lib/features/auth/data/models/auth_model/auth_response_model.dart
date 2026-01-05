import 'package:round_7_mobile_cure_team4/features/auth/domain/entities/auth_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_response_model.freezed.dart';
part 'auth_response_model.g.dart';

@freezed
abstract class AuthResponseModel with _$AuthResponseModel {
  const factory AuthResponseModel({
    required bool success,
    String? message,
    dynamic data,
  }) = _AuthResponseModel;

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);
}
extension AuthResponseToEntity on AuthResponseModel {
  AuthResponseEntity toEntity() {
    return AuthResponseEntity(
      success: success,
      data: data,
      message: message,

    );
  }
}
