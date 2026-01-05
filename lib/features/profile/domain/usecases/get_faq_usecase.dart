import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/core/helper/token_storage.dart';
import 'package:round_7_mobile_cure_team4/features/profile/domain/entities/faq_entity.dart';
import 'package:round_7_mobile_cure_team4/features/profile/domain/repositories/faq_repository.dart';

@LazySingleton()
class GetFaqUseCase {
  final FaqRepository repository;
  final TokenStorage _tokenStorage;

  GetFaqUseCase(this.repository, this._tokenStorage);

  Future<List<FaqEntity>> call() async {
    final token = await _tokenStorage.getAccessToken();
    if (token == null) throw Exception("User not authenticated");
    return await repository.getFaqs(token);
  }
}
