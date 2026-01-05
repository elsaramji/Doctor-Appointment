// ===================== DOCTOR ENTITY =====================
class DoctorDetailsEntity {
  final int id;
  final String userId;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String address;
  final String about;
  final double rating;
  final double pricePerHour;
  final int experienceYears;
  final String imgUrl;
  final int reviewsCount;
  final List<String> specialities;
  final List<String> licenses;
  final double latitude;
  final double longitude;
  final int bookingCount;
  final List<EntitySlot> availableSlots;
  final List<ReviewModelEntity> reviews;
  final bool isFavourite;


  DoctorDetailsEntity({
    required this.id,
    required this.userId,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.about,
    required this.rating,
    required this.pricePerHour,
    required this.experienceYears,
    required this.imgUrl,
    required this.reviewsCount,
    required this.specialities,
    required this.licenses,
    required this.latitude,
    required this.longitude,
    required this.bookingCount,
    required this.availableSlots,
    required this.reviews,
    required this.isFavourite,

  });
}
// ===================== SLOT ENTITY =====================
class EntitySlot {
  final int id;
  final int doctorId;
  final String dateTime;
  final String startTime;
  final String endTime;
  final bool isBooked;

  EntitySlot({
    required this.id,
    required this.doctorId,
    required this.dateTime,
    required this.startTime,
    required this.endTime,
    required this.isBooked,
  });
}
extension EntitySlotX on EntitySlot {
  Map<String, dynamic> toJson() {
    return {
      "slotId": id,
      "doctorId": doctorId,
      "date": dateTime,
      "startTime": startTime,
      "endTime": endTime,
      "isBooked": isBooked,
    };
  }
}
class ReviewModelEntity {
  final String? userName;
  final String? imageUrl;
  final String? comment;
  
  final String? createdAt;
  
  final double? rating;

  ReviewModelEntity({
    this.userName,
    this.imageUrl,
    this.comment,
    this.createdAt,
    this.rating,
  });

}
