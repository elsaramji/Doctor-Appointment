import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:round_7_mobile_cure_team4/features/pay/domain/entities/payment_response_entity.dart';

part 'payment_response_model.freezed.dart';
part 'payment_response_model.g.dart';

@freezed
abstract class PaymentResponseModel with _$PaymentResponseModel {
  const factory PaymentResponseModel({
    @Default(false) bool success,
    @Default('') String message,
    PaymentDataModel? data,
  }) = _PaymentResponseModel;

  factory PaymentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentResponseModelFromJson(json);
}

@freezed
abstract class PaymentDataModel with _$PaymentDataModel {
  const factory PaymentDataModel({
    @Default(0) int id,
    @Default(0) int doctorId,
    @Default('') String doctorName,
    @Default('') String doctorSpeciality,
    @Default('') String doctorImg,
    @Default(0) int patientId,
    @Default('') String patientName,
    @JsonKey(name: 'payment') @Default('') String paymentMethod,
    @Default('') String status,
    @Default('') String paymentUrl,
    DateTime? appointmentAt,
  }) = _PaymentDataModel;

  factory PaymentDataModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentDataModelFromJson(json);
}

extension PaymentDataModelMapper on PaymentDataModel {
  PaymentResponseEntity toEntity({bool success = false, String message = ''}) {
    return PaymentResponseEntity(
      success: success,
      message: message,
      id: id,
      doctorId: doctorId,
      doctorName: doctorName,
      doctorSpeciality: doctorSpeciality,
      doctorImg: doctorImg,
      patientId: patientId,
      patientName: patientName,
      paymentMethod: paymentMethod,
      status: status,
      paymentUrl: paymentUrl,
      appointmentAt: appointmentAt ?? DateTime.now(),
    );
  }
}

extension PaymentResponseModelMapper on PaymentResponseModel {
  PaymentResponseEntity toEntity() {
    return data?.toEntity(success: success, message: message) ??
        PaymentResponseEntity(
          success: success,
          message: message,
          id: 0,
          doctorId: 0,
          doctorName: '',
          doctorSpeciality: '',
          doctorImg: '',
          patientId: 0,
          patientName: '',
          paymentMethod: '',
          status: '',
          paymentUrl: '',
          appointmentAt: DateTime.now(),
        );
  }
}
