import '../../domain/entities/payment_method.dart';

class PaymentMethodModel extends PaymentMethod {
  PaymentMethodModel({
    required super.id,
    required super.methodName,
    required super.last3,
    required super.brand,
    required super.expMonth,
    required super.expYear,
    required super.isEnabled,
  });

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    return PaymentMethodModel(
      id: json['id'] ?? 0,
      methodName: json['methodName'] ?? '',
      last3: json['last3'] ?? '',
      brand: json['brand'] ?? '',
      expMonth: json['expMonth'] ?? 0,
      expYear: json['expYear'] ?? 0,
      isEnabled: json['isEnabled'] ?? false,
    );
  }
}
