import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:round_7_mobile_cure_team4/features/auth/domain/entities/verify_entity/verify_request_entity.dart';

part 'verify_request_model.freezed.dart';
part 'verify_request_model.g.dart';

@freezed
abstract class VerifyRequestModel with _$VerifyRequestModel {
  const factory VerifyRequestModel({
    required String phoneNumber,
    required String otpNumber,
  }) = _VerifyRequestModel;

  factory VerifyRequestModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyRequestModelFromJson(json);
}

extension VerifyRequestMapper on VerifyRequestModel {
  VerifyRequestEntity toEntity() {
    return VerifyRequestEntity(
      phoneNumber: phoneNumber,
      otpNumber: otpNumber,
    );
  }
}

extension VerifyRequestModelFromEntity on VerifyRequestEntity {
  VerifyRequestModel toModel() {
    return VerifyRequestModel(
      phoneNumber: phoneNumber,
      otpNumber: otpNumber,
    );
  }
}
