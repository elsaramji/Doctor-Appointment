import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/core/errors/errors.dart';
import 'package:round_7_mobile_cure_team4/core/helper/dio_helper.dart';
import 'package:round_7_mobile_cure_team4/features/chat/data/models/chat_model.dart';
import 'package:round_7_mobile_cure_team4/features/chat/domain/entities/chat_entity.dart';
import 'package:round_7_mobile_cure_team4/features/chat/domain/repos/chats_repo.dart';

@Singleton(as: ChatsRepo)
class ChatsRepoImpl implements ChatsRepo {
  final DioHelper _dio;
  ChatsRepoImpl(this._dio);

  // Assumed endpoints. Adjust if backend uses different routes.
  static const _base = 'api/chat/chat/chats';

  @override
  Future<Either<ApplicationError, ChatEntity>> createChat({
    required String receiverId,
  }) async {
   try {
    final res = await _dio.postRequest(
      "api/chat/chat/startChat?receiverId=$receiverId",
      {},
    );
    if (res != null && (res.statusCode == 200 || res.statusCode == 201)) {
      final data = res.data;
      return right(ChatModel.fromJson(data['data']));
    }
    return left(ApplicationError( message: 'Chick your internet connection'));
   }catch(e){
     log(e.toString());
     return left(ApplicationError( message: e.toString()));
   }
  }

  @override
  Future<Either<ApplicationError, List<ChatEntity>>> getChats() async {
    try {
      final res = await _dio.getRequest(_base);
      log(res.toString());
      if (res != null && res.statusCode == 200) {
        return right(ChatModel.listFromJson(res.data['data']["chatListDTOs"]));
      } else {
        return left(ApplicationError(message: 'Chick your internet connection'));
      }
    } catch (e) {
      log(e.toString());
      return left(ApplicationError(message: e.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, List<ChatEntity>>> searchChats({

    required String query,
  }) async {
    try {
      final res = await _dio.getRequest(
        '$_base?search=$query',
      );
      if (res != null && res.statusCode == 200) {
        final data = res.data;
        List<ChatEntity> chats = ChatModel.listFromJson(
          data['data']["chatListDTOs"],
        );
        return right(chats);
      }
      if (res != null && res.statusCode == 400) {
        return left(ApplicationError( message: res.data['message']));
      }
      return right([]);
    } catch (e) {
      return left(ApplicationError( message: e.toString()));
    }
  }

  @override
  Future<List<ChatEntity>> getUnreadChats() async {
    
    final res = await _dio.getRequest('$_base?isUnRead=true');
    if (res != null && res.statusCode == 200) {
      final data = res.data;
      if (data['data']['chatListDTOs'] is List) {
        log(data['data']['chatListDTOs'].toString());
      }
      return ChatModel.listFromJson(data['data']['chatListDTOs']);
    }
    log("Response is :$res");
    return <ChatEntity>[];
  }

  @override
  Future<List<ChatEntity>> searchUnreadChats({
    
    required String query,
  }) async {
   
    final res = await _dio.getRequest(
      '$_base/unread/search',
      queryParameters: {'q': query},
    
    );
    if (res != null && res.statusCode == 200) {
      final data = res.data;
      // if (data is List) return ChatModel.listFromJson(data);
      if (data is Map && data['data'] is List) {
        return ChatModel.listFromJson(data['data']);
      }
    }
    return <ChatEntity>[];
  }

  @override
  Future<List<ChatEntity>> getFavoriteChats() async {
   
    final res = await _dio.getRequest('$_base/favorites');
    if (res != null && res.statusCode == 200) {
      final data = res.data;
      //  if (data is List) return ChatModel.listFromJson(data);
      if (data is Map && data['data'] is List) {
        return ChatModel.listFromJson(data['data']);
      }
    }
    return <ChatEntity>[];
  }

  @override
  Future<void> addFavoriteChat({
  
    required String chatId,
  }) async {
    final res = await _dio.postRequest(
      '$_base/$chatId/favorite',
      null,
      
    );
    if (res == null || (res.statusCode != 200 && res.statusCode != 201)) {
      throw Exception('Failed to add favorite chat');
    }
  }

  @override
  Future<void> removeFavoriteChat({
    required String chatId,
  }) async {
    final res = await _dio.deleteRequest(
      '$_base/$chatId/favorite',
    );
    if (res == null || (res.statusCode != 200 && res.statusCode != 204)) {
      throw Exception('Failed to remove favorite chat');
    }
  }
}
