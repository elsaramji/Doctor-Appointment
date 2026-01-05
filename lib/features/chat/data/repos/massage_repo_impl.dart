import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/chat/domain/entities/massage_entity.dart';
import 'package:round_7_mobile_cure_team4/features/chat/domain/repos/massage_repo.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/helper/dio_helper.dart';
import '../models/message_model.dart';

@Singleton(as: MassageRepo)
class MassageRepoImpl implements MassageRepo {
  final DioHelper _dioHelper;
  MassageRepoImpl(this._dioHelper);
  @override
  Future<Either<ApplicationError, List<MessageEntity>>> getMessages({
    required String receiverId,
  }) async {
    try {
      final res = await _dioHelper.postRequest(
        "api/chat/chat/startChat?receiverId=$receiverId",
        null,
      );
      if (res != null && res.statusCode == 200) {
        final data = res.data;
        return right(MessageModel.listFromJson(data['data']['messageListDTO']));
      } else {
        return left(
          ApplicationError(message: 'Chick your internet connection'),
        );
      }
    } catch (e) {
      return left(ApplicationError(message: e.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, String>> sendMessage({
    required MessageModel message,
    required String receiverId,
    required int chatId,
    String? filePath, // ⬅️ هنا الملف اللي هنبعته
  }) async {
    try {
      final formData = FormData.fromMap({
        'chatId': chatId,
        'ReceiverId': receiverId,
        'Content': message.content ?? '',
        'file': filePath != null
            ? await MultipartFile.fromFile(
                filePath,
                filename: filePath.split('/').last,
              )
            : null,
      });

      final res = await _dioHelper.postRequest("api/chat/chat/send", formData);

      if (res != null && res.statusCode == 200) {
        log(res.data.toString());
        return right(res.data['message'].toString());
      } else {
        log("Response is :$res");
        return left(
          ApplicationError(message: 'Check your internet connection'),
        );
      }
    } catch (e) {
      return left(ApplicationError(message: e.toString()));
    }
  }
}
