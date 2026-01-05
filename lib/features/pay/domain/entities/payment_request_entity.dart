class PaymentRequestEntity {
  final int doctorId;
  final int slotId;
  final double amount;
  final int payment;
  final int status;
  final String appointmentAt;

  PaymentRequestEntity({
    required this.doctorId,
    required this.slotId,
    required this.amount,
    required this.payment,
    required this.status,
    required this.appointmentAt,
  });
}
