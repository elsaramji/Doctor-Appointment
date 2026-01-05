class RescheduleEntity {
  final String newDateTime;

  RescheduleEntity({
    required this.newDateTime,
  });
}

// ----------------------------------------------------

class RescheduleResponseEntity {
  final bool success;
  final String message;

  RescheduleResponseEntity({
    required this.success,
    required this.message,
  });
}