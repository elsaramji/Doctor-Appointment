class VerifyResponseEntity {
  final bool success;
  final String message;
  final String accessToken;
  final String refreshToken;

  VerifyResponseEntity({
    required this.success,
    required this.message,
    required this.accessToken,
    required this.refreshToken,
  });
}
