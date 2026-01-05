class HistoryEntity {
  final int id;
  final String keyword;
  final String date;

  const HistoryEntity({
    required this.id,
    required this.keyword,
    required this.date,
  });

  HistoryEntity copyWith({int? id, String? keyword, String? date}) =>
      HistoryEntity(
        id: id ?? this.id,
        keyword: keyword ?? this.keyword,
        date: date ?? this.date,
      );
}
