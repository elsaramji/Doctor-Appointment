import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:round_7_mobile_cure_team4/features/chat/domain/entities/massage_entity.dart';

import '../../../../core/errors/errors.dart';
import '../../data/models/message_model.dart';

abstract class MassageRepo {

  Future<Either<ApplicationError, String>> sendMessage({
    required MessageModel message,
    required String receiverId,
    required int chatId,
    String? filePath,

  });

  Future<Either<ApplicationError, List<MessageEntity>>> getMessages({
    
    required String receiverId,
  });
}
