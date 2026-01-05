import 'dart:convert';
import 'package:round_7_mobile_cure_team4/features/HomePage/domain/Entities/allSpecialtiesEntity.dart';

List<AllSpecialtiesModel> specialtiesFromJson(dynamic jsonData) =>
    List<AllSpecialtiesModel>.from(
      (jsonData as List).map((x) => AllSpecialtiesModel.fromJson(x)),
    );


String specialtiesToJson(List<AllSpecialtiesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllSpecialtiesModel extends AllSpecialtiesEntity {
  const AllSpecialtiesModel({
    required super.id,
    required super.title,
    required super.imgUrl,
  });

  factory AllSpecialtiesModel.fromJson(Map<String, dynamic> json) {
    return AllSpecialtiesModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? "No title",
      imgUrl: json['emoji'] ?? "🏥", // Use emoji from API, default to hospital emoji
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "imgUrl": imgUrl,
    };
  }
}
