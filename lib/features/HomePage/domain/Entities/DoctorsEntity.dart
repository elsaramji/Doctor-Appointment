class DoctorsEntity {
  final int id;
  final String fullName;
  final String imgUrl;
  final int specialityId;
  final String specialistTitle;
  final String address;
  final double distance;
  final double rating;
  final bool isFavourite;
  final String startDate;
  final String endDate;
  final double latitude;
  final double longitude;
  const DoctorsEntity({
    required this.id,
    required this.fullName,
    required this.imgUrl,
    required this.specialityId,
    required this.address,
    required this.distance,
    required this.rating,
    required this.isFavourite,
    required this.specialistTitle,
    required this.startDate,
    required this.endDate,
    required this.latitude,
    required this.longitude,
  });

  DoctorsEntity copyWith({
    int? id,
    String? fullName,
    String? imgUrl,
    int? specialityId,
    String? specialistTitle,
    String? address,
    double? distance,
    double? rating,
    bool? isFavourite,
    String? startDate,
    String? endDate,
    double? latitude,
    double? longitude,
  }) => DoctorsEntity(
    id: id ?? this.id,
    fullName: fullName ?? this.fullName,
    imgUrl: imgUrl ?? this.imgUrl,
    specialityId: specialityId ?? this.specialityId,
    specialistTitle: specialistTitle ?? this.specialistTitle,
    address: address ?? this.address,
    distance: distance ?? this.distance,
    rating: rating ?? this.rating,
    isFavourite: isFavourite ?? this.isFavourite,
    startDate: startDate ?? this.startDate,
    endDate: endDate ?? this.endDate,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
  );
}
