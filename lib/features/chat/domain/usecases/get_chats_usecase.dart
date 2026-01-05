import 'package:dartz/dartz.dart';
import 'package:round_7_mobile_cure_team4/features/chat/domain/repos/chats_repo.dart';

import '../../../../core/errors/errors.dart';
import '../entities/chat_entity.dart';

class GetChatsUsecase {
  final ChatsRepo chatsRepo;
  GetChatsUsecase(this.chatsRepo);

  Future<Either<ApplicationError, List<ChatEntity>>> call() async{
   return await chatsRepo.getChats();
  }
}

class GetUnreadChatsUsecase {
  final ChatsRepo chatsRepo;
  GetUnreadChatsUsecase(this.chatsRepo);

  Future<List<ChatEntity>> call() async{
    return await chatsRepo.getUnreadChats();
  }
}
