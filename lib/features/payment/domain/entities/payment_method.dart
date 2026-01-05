class PaymentMethod {
  final int id;
  final String methodName;
  final String last3;
  final String brand;
  final int expMonth;
  final int expYear;
  final bool isEnabled;

  PaymentMethod({
    required this.id,
    required this.methodName,
    required this.last3,
    required this.brand,
    required this.expMonth,
    required this.expYear,
    required this.isEnabled,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return PaymentMethod(
      id: json['id'] is int
          ? json['id']
          : int.tryParse(json['id']?.toString() ?? '0') ?? 0,
      methodName: json['methodName']?.toString() ?? '',
      last3: json['last3']?.toString() ?? '',
      brand: json['brand']?.toString() ?? '',
      expMonth: json['expMonth'] is int
          ? json['expMonth']
          : int.tryParse(json['expMonth']?.toString() ?? '0') ?? 0,
      expYear: json['expYear'] is int
          ? json['expYear']
          : int.tryParse(json['expYear']?.toString() ?? '0') ?? 0,
      isEnabled: json['isEnabled'] is bool
          ? json['isEnabled']
          : (json['isEnabled']?.toString().toLowerCase() == 'true'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'methodName': methodName,
      'last3': last3,
      'brand': brand,
      'expMonth': expMonth,
      'expYear': expYear,
      'isEnabled': isEnabled,
    };
  }
}
