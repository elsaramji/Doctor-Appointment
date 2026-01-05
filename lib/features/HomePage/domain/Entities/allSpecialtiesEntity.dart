class AllSpecialtiesEntity {
  final int id;
  final String title;
  final String imgUrl;

  const AllSpecialtiesEntity({
    required this.id,
    required this.title,
    required this.imgUrl,
  });

  AllSpecialtiesEntity copyWith({int? id, String? title, String? imgUrl}) =>
      AllSpecialtiesEntity(
        id: id ?? this.id,
        title: title ?? this.title,
        imgUrl: imgUrl ?? this.imgUrl,
      );
}
