class AuthModel {
  final bool success;
  final String message;
  final AuthDataModel? data;

  AuthModel({required this.success, required this.message, this.data});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null ? AuthDataModel.fromJson(json['data']) : null,
    );
  }
}

class AuthDataModel {
  final String token;
  final String refreshToken;

  AuthDataModel({required this.token, required this.refreshToken});

  factory AuthDataModel.fromJson(Map<String, dynamic> json) {
    return AuthDataModel(
      token: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
}
