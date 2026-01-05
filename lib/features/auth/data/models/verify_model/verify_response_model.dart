import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:round_7_mobile_cure_team4/features/auth/domain/entities/verify_entity/verify_response_entity.dart';

part 'verify_response_model.freezed.dart';
part 'verify_response_model.g.dart';

@freezed
abstract class VerifyResponseModel with _$VerifyResponseModel {
  const factory VerifyResponseModel({
    required bool success,
    required String message,
    required VerifyDataModel data,
  }) = _VerifyResponseModel;

  factory VerifyResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyResponseModelFromJson(json);
}

@freezed
abstract class VerifyDataModel with _$VerifyDataModel {
  const factory VerifyDataModel({
    required String accessToken,
    required String refreshToken,
  }) = _VerifyDataModel;

  factory VerifyDataModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyDataModelFromJson(json);
}
extension VerifyResponseMapper on VerifyResponseModel {
  VerifyResponseEntity toEntity() {
    return VerifyResponseEntity(
      success: success,
      message: message,
      accessToken: data.accessToken,
      refreshToken: data.refreshToken,
    );
  }
}
