import 'package:dartz/dartz.dart';
import 'package:round_7_mobile_cure_team4/features/chat/domain/entities/chat_entity.dart';

import '../../../../core/errors/errors.dart';

abstract class ChatsRepo {
  // create chat
  Future<Either<ApplicationError, ChatEntity>> createChat({
    required String receiverId,
  });
  // get all chats
  Future<Either<ApplicationError, List<ChatEntity>>> getChats();
  // search for chats
  Future<Either<ApplicationError, List<ChatEntity>>> searchChats({
    required String query,
  });
  // get unread chats
  Future<List<ChatEntity>> getUnreadChats();
  // search for unread chats
  Future<List<ChatEntity>> searchUnreadChats({required String query});
  // get favorite chats
  Future<List<ChatEntity>> getFavoriteChats();
  // add favorite chat
  Future<void> addFavoriteChat({required String chatId});
  // remove favorite chat
  Future<void> removeFavoriteChat({required String chatId});
}
