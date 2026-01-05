class PaymentResponseEntity {
  final bool success;
  final String message;
  final int id;
  final int doctorId;
  final String doctorName;
  final String doctorSpeciality;
  final String doctorImg;
  final int patientId;
  final String patientName;
  final String paymentMethod;
  final String status;
  final String paymentUrl;
  final DateTime appointmentAt;

  PaymentResponseEntity({
    required this.success,
    required this.message,
    required this.id,
    required this.doctorId,
    required this.doctorName,
    required this.doctorSpeciality,
    required this.doctorImg,
    required this.patientId,
    required this.patientName,
    required this.paymentMethod,
    required this.status,
    required this.paymentUrl,
    required this.appointmentAt,
  });
}
