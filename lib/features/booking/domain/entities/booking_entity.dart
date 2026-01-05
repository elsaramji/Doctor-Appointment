class BookingEntity {
  final int id;
  final int doctorId;
  final String doctorName;
  final String doctorSpeciality;
  final String? doctorImageUrl;
  final String appointmentAt;
  final String status;

  const BookingEntity({
    required this.id,
    required this.doctorId,
    required this.doctorName,
    required this.doctorSpeciality,
    this.doctorImageUrl,
    required this.appointmentAt,
    required this.status,
  });
}
