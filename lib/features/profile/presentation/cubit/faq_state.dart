
import '../../domain/entities/faq_entity.dart';

abstract class FaqState {}

class FaqInitial extends FaqState {}

class FaqLoading extends FaqState {}

class FaqLoaded extends FaqState {
  final List<FaqEntity> faqs;
  FaqLoaded(this.faqs);
}

class FaqError extends FaqState {
  final String message;
  FaqError(this.message);
}
