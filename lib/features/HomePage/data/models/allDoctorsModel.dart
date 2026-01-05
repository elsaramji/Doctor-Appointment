import 'dart:convert';

import 'package:round_7_mobile_cure_team4/core/helper/assets.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/domain/Entities/DoctorsEntity.dart';

List<DoctorsModel> docsFromJson(dynamic jsonData) {
  if (jsonData == null) return [];
  if (jsonData is! List) return [];

  return jsonData.map((x) {
    if (x is Map<String, dynamic>) {
      return DoctorsModel.fromJson(x);
    } else {
      return DoctorsModel.empty();
    }
  }).toList();
}

String docsToJson(List<DoctorsModel> data) =>
    json.encode(data.map((x) => x.toJson()).toList());

class DoctorsModel extends DoctorsEntity {
  const DoctorsModel({
    required super.id,
    required super.fullName,
    required super.imgUrl,
    required super.specialityId,
    required super.address,
    required super.distance,
    required super.rating,
    required super.isFavourite,
    required super.specialistTitle,
    required super.startDate,
    required super.endDate,
    required super.latitude,
    required super.longitude,
  });

  factory DoctorsModel.fromJson(Map<String, dynamic> json) {
    double parseDouble(dynamic value) {
      if (value == null) return 0.0;
      if (value is int) return value.toDouble();
      if (value is double) return value;
      if (value is String) return double.tryParse(value) ?? 0.0;
      return 0.0;
    }

    return DoctorsModel(
      id: json['id'] ?? 0,
      fullName: json['fullName'] ?? json['title'] ?? "No Name",
      imgUrl: json['imgUrl'] ?? ImageAssets.fakeDoctorImage1,
      specialityId: json['specialityId'] ?? 0,
      address: json['address'] ?? "",
      distance: parseDouble(json['distance']),
      rating: parseDouble(json['rating']),
      isFavourite: json['isFavourite'] ?? false,
      specialistTitle: json['specialistTitle'] ?? json['title'] ?? "",
      startDate: json['startDate'] ?? "_",
      endDate: json['endDate'] ?? "_",
      latitude: parseDouble(json['latitude']),
      longitude: parseDouble(json['longitude']),
    );
  }

  factory DoctorsModel.empty() {
    return const DoctorsModel(
      id: 0,
      fullName: "",
      imgUrl: "",
      specialityId: 0,
      address: "",
      distance: 0.0,
      rating: 0.0,
      isFavourite: false,
      specialistTitle: "",
      startDate: "_",
      endDate: "_",
      latitude: 0.0,
      longitude: 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "fullName": fullName,
      "imgUrl": imgUrl,
      "specialityId": specialityId,
      "address": address,
      "distance": distance,
      "rating": rating,
      "isFavourite": isFavourite,
      "specialistTitle": specialistTitle,
      "startDate": startDate,
      "endDate": endDate,
      "latitude": latitude,
      "longitude": longitude,
    };
  }
}
