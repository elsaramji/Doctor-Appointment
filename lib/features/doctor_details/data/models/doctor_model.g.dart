// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => _ReviewModel(
  userName: json['userName'] as String?,
  imageUrl: json['imageUrl'] as String?,
  comment: json['comment'] as String?,
  createdAt: _fixDate(json['createdAt'] as String?),
  rating: (json['rating'] as num?)?.toDouble(),
);

Map<String, dynamic> _$ReviewModelToJson(_ReviewModel instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'imageUrl': instance.imageUrl,
      'comment': instance.comment,
      'createdAt': instance.createdAt,
      'rating': instance.rating,
    };

_Doctor _$DoctorFromJson(Map<String, dynamic> json) => _Doctor(
  id: (json['id'] as num).toInt(),
  userId: json['userId'] as String,
  fullName: json['fullName'] as String,
  email: json['email'] as String,
  phoneNumber: json['phoneNumber'] as String,
  address: json['address'] as String,
  about: json['about'] as String,
  rating: (json['rating'] as num).toDouble(),
  pricePerHour: (json['pricePerHour'] as num).toInt(),
  experienceYears: (json['experienceYears'] as num).toInt(),
  imgUrl: json['imgUrl'] as String,
  reviewsCount: (json['reviewsCount'] as num).toInt(),
  reviews: (json['reviews'] as List<dynamic>)
      .map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  specialities: (json['specialities'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  licenses: (json['licenses'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['langtude'] as num).toDouble(),
  bookingCount: (json['bookingCount'] as num).toInt(),
  availableSlots: (json['availableSlots'] as List<dynamic>)
      .map((e) => Slot.fromJson(e as Map<String, dynamic>))
      .toList(),
  isFavourite: json['isFavourite'] as bool? ?? false,
);

Map<String, dynamic> _$DoctorToJson(_Doctor instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'fullName': instance.fullName,
  'email': instance.email,
  'phoneNumber': instance.phoneNumber,
  'address': instance.address,
  'about': instance.about,
  'rating': instance.rating,
  'pricePerHour': instance.pricePerHour,
  'experienceYears': instance.experienceYears,
  'imgUrl': instance.imgUrl,
  'reviewsCount': instance.reviewsCount,
  'reviews': instance.reviews,
  'specialities': instance.specialities,
  'licenses': instance.licenses,
  'latitude': instance.latitude,
  'langtude': instance.longitude,
  'bookingCount': instance.bookingCount,
  'availableSlots': instance.availableSlots,
  'isFavourite': instance.isFavourite,
};

_Slot _$SlotFromJson(Map<String, dynamic> json) => _Slot(
  id: (json['id'] as num).toInt(),
  doctorId: (json['doctorId'] as num).toInt(),
  dateTime: json['dateTime'] as String,
  startTime: json['startTime'] as String,
  endTime: json['endTime'] as String,
  isBooked: json['isBooked'] as bool,
);

Map<String, dynamic> _$SlotToJson(_Slot instance) => <String, dynamic>{
  'id': instance.id,
  'doctorId': instance.doctorId,
  'dateTime': instance.dateTime,
  'startTime': instance.startTime,
  'endTime': instance.endTime,
  'isBooked': instance.isBooked,
};
