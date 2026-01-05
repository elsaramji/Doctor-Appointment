import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/add_review/domain/entities/add_review_request_entity.dart';
import 'package:round_7_mobile_cure_team4/features/add_review/domain/usecases/add_review_usecase.dart';

import 'add_review_state.dart';

@injectable
class AddReviewCubit extends Cubit<AddReviewState> {
  final AddReviewUseCase _useCase;

  AddReviewCubit(this._useCase) : super(const AddReviewState.initial());

  Future<void> addReview(AddReviewRequestEntity review) async {
    emit(const AddReviewState.loading());
    try {
      final response = await _useCase.call(review);
      emit(AddReviewState.success(response: response));
    } catch (e) {
      emit(AddReviewState.error(error: e.toString()));
    }
  }
}


