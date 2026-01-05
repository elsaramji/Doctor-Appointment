class AuthResponseEntity {
  final bool success;
  final String? message;
  final dynamic data;

  AuthResponseEntity({
    required this.success,
    this.message,
    this.data,
  });
}
