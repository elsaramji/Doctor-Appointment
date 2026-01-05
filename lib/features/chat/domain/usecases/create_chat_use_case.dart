import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/chat/domain/repos/chats_repo.dart';

import '../../../../core/errors/errors.dart';
import '../entities/chat_entity.dart';

@injectable
class CreateChatUseCase {
  final ChatsRepo chatsRepo;
  CreateChatUseCase({required this.chatsRepo});

  Future<Either<ApplicationError, ChatEntity>> call({
    required String receiverId,
  }) async {
    return await chatsRepo.createChat(receiverId: receiverId);
  }
}
