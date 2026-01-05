// abstract class for all Failures
abstract class Failure {
  final String message;
  const Failure({required this.message});
}

// Server error (500, 404, etc.)
class ServerFailure extends Failure {
  const ServerFailure({super.message = "Server Error"});
}

// Connection error (no internet)
class ConnectionFailure extends Failure {
  const ConnectionFailure({super.message = "No Internet Connection"});
}

// Unauthorized or forbidden
class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({super.message = "Unauthorized"});
}

// Any other unknown error
class UnknownFailure extends Failure {
  const UnknownFailure({super.message = "Unknown Error"});
}

class ApplicationError {
  final String message;
  const ApplicationError({required this.message});
}
