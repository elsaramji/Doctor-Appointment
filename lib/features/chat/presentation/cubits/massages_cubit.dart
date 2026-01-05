import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/core/errors/errors.dart';
import 'package:round_7_mobile_cure_team4/features/chat/domain/repos/massage_repo.dart';
import 'package:round_7_mobile_cure_team4/features/chat/domain/usecases/get_massages_usecase.dart';

import '../../data/models/message_model.dart';
import '../../domain/entities/massage_entity.dart';
import '../../domain/usecases/send_massage_use_case.dart';

part 'massages_state.dart';

@injectable
class MassagesCubit extends Cubit<MassagesState> {
  MassagesCubit(this.massageRepo) : super(MassagesInitial());
  final MassageRepo massageRepo;

  void getMassages({required String receiverId}) async {
    final GetMassagesUsecase getMassagesUsecase = GetMassagesUsecase(
      massageRepo: massageRepo,
    );
    emit(MassagesLoading());
    final result = await getMassagesUsecase.call(receiverId: receiverId);
    result.fold(
      (l) => emit(MassagesError(error: l)),
      (r) => emit(MassagesLoaded(massages: r)),
    );
  }

  void sendMessage({
    required String receiverId,
    required MessageModel message,
    required int chatId,
    XFile? imageFile,
  }) async {
    final SendMassageUseCase sendMassageUseCase = SendMassageUseCase(
      massageRepo,
    );
    // emit(MassagesLoading());
    final result = await sendMassageUseCase.call(
      receiverId: receiverId,
      chatId: chatId,
      message: message,
      filePath: imageFile?.path,
    );
    result.fold((l) => null, (r) => null);
  }

  Future<void> sendImageMessage({
    required String receiverId,
    required int chatId,
    required String senderId,
    required XFile imageFile,
  }) async {
    final message = MessageModel(
      content:
          '', // Content is empty for image messages usually, or could be "Image"
      isPatient: true,
      senderUserId: senderId,
      sentAt: DateTime.now().toIso8601String(),
      isRead: false,
      mediaUrl:
          imageFile.path, // Temporarily hold path for local display if needed
    );

    sendMessage(
      receiverId: receiverId,
      message: message,
      chatId: chatId,
      imageFile: imageFile,
    );

    // Optimistic update or refresh
    // getMassages(receiverId: receiverId);
  }
}
