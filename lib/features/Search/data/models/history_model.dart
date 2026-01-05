import 'dart:convert';

import 'package:round_7_mobile_cure_team4/features/Search/domain/entities/history_entity.dart';

List<HistoryModel> docsFromJson(dynamic jsonData) {
  if (jsonData == null) return [];
  if (jsonData is! List) return [];

  return jsonData.map((x) {
    if (x is Map<String, dynamic>) {
      return HistoryModel.fromJson(x);
    } else {
      return HistoryModel.empty();
    }
  }).toList();
}

String docsToJson(List<HistoryModel> data) =>
    json.encode(data.map((x) => x.toJson()).toList());

class HistoryModel extends HistoryEntity {
  HistoryModel({
    required super.id,
    required super.keyword,
    required super.date,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      id: json['id'] ?? 0,
      keyword: json['keyword'] ?? "No thing",
      date: json['date'] ?? "_",
    );
  }

  factory HistoryModel.empty() {
    return HistoryModel(id: 0, keyword: "", date: "");
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "keyword": keyword, "date": date};
  }
}
