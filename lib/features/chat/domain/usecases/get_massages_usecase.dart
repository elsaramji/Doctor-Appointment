import 'package:dartz/dartz.dart';
import 'package:round_7_mobile_cure_team4/features/chat/domain/repos/massage_repo.dart';

import '../../../../core/errors/errors.dart';
import '../entities/massage_entity.dart';

class GetMassagesUsecase {
  final MassageRepo massageRepo;
  GetMassagesUsecase({required this.massageRepo});

  Future<Either<ApplicationError, List<MessageEntity>>> call({
    
    required String receiverId,
  }) => massageRepo.getMessages( receiverId: receiverId);
}
