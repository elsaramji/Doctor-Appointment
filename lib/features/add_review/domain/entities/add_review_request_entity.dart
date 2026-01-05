class AddReviewRequestEntity {
  final int doctorId;
  final int rating;
  final String comment;

  const AddReviewRequestEntity({
    required this.doctorId,
    required this.rating,
    required this.comment,
  });
}
