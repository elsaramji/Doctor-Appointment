import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../data/models/message_model.dart';
import '../repos/massage_repo.dart';

class SendMassageUseCase {
  final MassageRepo massageRepo;
  SendMassageUseCase(this.massageRepo);

  Future<Either<ApplicationError, String>> call({
    required MessageModel message,
    required String receiverId,
    required int chatId,
   String? filePath,
  }) async => await massageRepo.sendMessage(
    message: message,
    receiverId: receiverId,
    chatId: chatId,
    filePath: filePath,
  );
}
