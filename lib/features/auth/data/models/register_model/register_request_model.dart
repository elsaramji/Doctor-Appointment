import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:round_7_mobile_cure_team4/features/auth/domain/entities/register_entity.dart';

part 'register_request_model.freezed.dart';
part 'register_request_model.g.dart';

@freezed
abstract class RegisterRequestModel with _$RegisterRequestModel {
  const factory RegisterRequestModel({
    required String fullName,
    required String phoneNumber,
    @JsonKey(name: "Email") required String email,
  }) = _RegisterRequestModel;

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestModelFromJson(json);
  factory RegisterRequestModel.fromEntity(RegisterRequestEntity entity) {
    return RegisterRequestModel(
      fullName: entity.fullName,
      phoneNumber: entity.phoneNumber,
      email: entity.email,
    );
  }
}
extension RegisterModelToEntity on RegisterRequestModel {
  RegisterRequestEntity toEntity() {
    return RegisterRequestEntity(
      fullName: fullName,
      phoneNumber: phoneNumber,
      email: email,
    );
  }
}
extension RegisterEntityToModel on RegisterRequestEntity {
  RegisterRequestModel toModel() {
    return RegisterRequestModel(
      fullName: fullName,
      phoneNumber: phoneNumber,
      email: email,
    );
  }
}
