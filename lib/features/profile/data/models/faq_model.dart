import '../../domain/entities/faq_entity.dart';

class FaqModel extends FaqEntity {
  FaqModel({
    required super.id,
    required super.question,
    required super.answer,
  });

  factory FaqModel.fromJson(Map<String, dynamic> json) {
    return FaqModel(
      id: json['id'],
      question: json['question'],
      answer: json['answer'],
    );
  }
}
