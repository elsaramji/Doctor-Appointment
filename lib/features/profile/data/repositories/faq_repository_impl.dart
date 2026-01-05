import 'package:injectable/injectable.dart';
import '../../domain/entities/faq_entity.dart';
import '../../domain/repositories/faq_repository.dart';
import '../datasources/faq_remote_datasource.dart';
import '../models/faq_model.dart';

@LazySingleton(as: FaqRepository)
class FaqRepositoryImpl implements FaqRepository {
  final FaqRemoteDataSource remoteDataSource;

  FaqRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<FaqEntity>> getFaqs(String token) async {
    final List<FaqModel> models = await remoteDataSource.getFaqs(token);
    return models
        .map(
          (model) => FaqEntity(
        id: model.id,
        question: model.question,
        answer: model.answer,
      ),
    )
        .toList();
  }
}
