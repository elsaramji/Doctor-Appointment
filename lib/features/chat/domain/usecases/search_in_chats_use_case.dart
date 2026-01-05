import 'package:dartz/dartz.dart';
import 'package:round_7_mobile_cure_team4/features/chat/domain/repos/chats_repo.dart';

import '../../../../core/errors/errors.dart';
import '../entities/chat_entity.dart';

class SearchInChatsUseCase {
  final ChatsRepo chatsRepo;
  SearchInChatsUseCase({required this.chatsRepo});

  Future<Either<ApplicationError, List<ChatEntity>>> call({
    required String query,
  }) async {
    return await chatsRepo.searchChats(query: query);
  }
}
