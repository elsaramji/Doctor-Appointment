import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/get_faq_usecase.dart';
import 'faq_state.dart';

@injectable
class FaqCubit extends Cubit<FaqState> {
  final GetFaqUseCase getFaqUseCase;

  FaqCubit(this.getFaqUseCase) : super(FaqInitial());

  Future<void> fetchFaqs() async {
    emit(FaqLoading());
    try {
      final faqs = await getFaqUseCase();
      emit(FaqLoaded(faqs));
    } catch (e) {
      emit(FaqError(e.toString()));
    }
  }
}
