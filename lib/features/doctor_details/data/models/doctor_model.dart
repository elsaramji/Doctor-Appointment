import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:round_7_mobile_cure_team4/features/doctor_details/domain/entities/doctor_details_entity.dart';

part 'doctor_model.freezed.dart';
part 'doctor_model.g.dart';

// -----------------------------------------------------------------------------
// 1.  (Reviews Model)
// -----------------------------------------------------------------------------

@freezed
abstract class ReviewModel with _$ReviewModel {
  const factory ReviewModel({
    required String? userName,
    required String? imageUrl,
    required String? comment,

    @JsonKey(
      name: 'createdAt',
      fromJson: _fixDate,
    )
    required String? createdAt,
    
    required double? rating,
  }) = _ReviewModel;

  factory ReviewModel.fromJson(Map<String, dynamic> json) => _$ReviewModelFromJson(json);
}

/// تصحيح التاريخ هنا فقط ✨
String? _fixDate(String? rawDate) {
  if (rawDate == null || rawDate.isEmpty || rawDate.startsWith("0001")) {
    return null;
  }
  return rawDate;
}


// -----------------------------------------------------------------------------
// 2.  (Doctor Model)
// -----------------------------------------------------------------------------

@freezed
abstract class Doctor with _$Doctor {
  const factory Doctor({
    required int id,
    required String userId,
    required String fullName,
    required String email,
    required String phoneNumber,
    required String address,
    required String about,
    required double rating,
    required int pricePerHour,
    required int experienceYears,
    required String imgUrl,
    required int reviewsCount,
    required List<ReviewModel> reviews,
    required List<String> specialities,
    required List<String> licenses,
    required double latitude,
    @JsonKey(name: 'langtude') required double longitude,
    required int bookingCount,
    required List<Slot> availableSlots,
    @Default(false) bool isFavourite,
  }) = _Doctor;

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);
}

// -----------------------------------------------------------------------------
// 3.  (Slot Model)
// -----------------------------------------------------------------------------

@freezed
abstract class Slot with _$Slot {
  const Slot._(); // for custom getters

  const factory Slot({
    required int id,
    required int doctorId,
    required String dateTime,
    required String startTime,
    required String endTime,
    required bool isBooked,
  }) = _Slot;

  factory Slot.fromJson(Map<String, dynamic> json) => _$SlotFromJson(json);

  DateTime get startDateTime => _combineDateTime(dateTime, startTime);
  DateTime get endDateTime => _combineDateTime(dateTime, endTime);

  DateTime _combineDateTime(String date, String time) {
    try {
      final d = DateTime.parse(date);
      final parts = time.split(':').map(int.parse).toList();
      return DateTime(d.year, d.month, d.day, parts[0], parts[1], parts[2]);
    } catch (e) {
      return DateTime.now();
    }
  }
}

// -----------------------------------------------------------------------------
// 4 (Extensions)
// -----------------------------------------------------------------------------

extension DoctorX on Doctor {
  DoctorDetailsEntity toEntity() {
    return DoctorDetailsEntity(
      id: id,
      userId: userId,
      fullName: fullName,
      email: email,
      phoneNumber: phoneNumber,
      address: address,
      about: about,
      rating: rating,
      pricePerHour: pricePerHour.toDouble(),
      experienceYears: experienceYears,
      imgUrl: imgUrl,
      reviewsCount: reviewsCount,
      reviews: reviews.map((r) => r.toEntity()).toList(),
      specialities: specialities,
      licenses: licenses,
      latitude: latitude,
      longitude: longitude,
      bookingCount: bookingCount,
      availableSlots: availableSlots.map((slot) => slot.toEntity()).toList(),
      isFavourite: isFavourite,
    );
  }
}


extension SlotX on Slot {
  EntitySlot toEntity() {
    return EntitySlot(
      id: id,
      doctorId: doctorId,
      dateTime: dateTime,
      startTime: startTime,
      endTime: endTime,
      isBooked: isBooked,
    );
  }
}
extension ReviewModelX on ReviewModel {
  ReviewModelEntity toEntity() {
    return ReviewModelEntity(
      userName: userName,
      imageUrl: imageUrl,
      comment: comment,
      createdAt: createdAt,
      rating: rating,
    );
  }
}