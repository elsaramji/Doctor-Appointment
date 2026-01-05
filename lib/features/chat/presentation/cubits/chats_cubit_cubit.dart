// chats_cubit_cubit.dart

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/chat/domain/usecases/search_in_chats_use_case.dart';

import '../../domain/entities/chat_entity.dart';
import '../../domain/repos/chats_repo.dart';
import '../../domain/usecases/create_chat_use_case.dart';
import '../../domain/usecases/get_chats_usecase.dart';

part 'chats_cubit_state.dart';

@injectable
class ChatsCubit extends Cubit<ChatsCubitState> {
  ChatsCubit(this.chatsRepo) : super(ChatsCubitInitial());
  final ChatsRepo chatsRepo;

  void getChats() async {
    GetChatsUsecase getMassagesUsecase = GetChatsUsecase(chatsRepo);
    emit(ChatsCubitLoading());
    final result = await getMassagesUsecase.call();
    result.fold(
      (l) => emit(ChatsCubitError(l.message)),
      (r) => emit(ChatsCubitLoaded(r)),
    );
  }

  void searchChats({required String query}) async {
    SearchInChatsUseCase getMassagesUsecase = SearchInChatsUseCase(
      chatsRepo: chatsRepo,
    );

    final result = await getMassagesUsecase.call(query: query);
    result.fold(
      (l) => emit(ChatsCubitError(l.message)),
      (r) => emit(ChatsCubitLoaded(r)),
    );
  }

  void getUnreadChats() async {
    GetUnreadChatsUsecase getMassagesUsecase = GetUnreadChatsUsecase(chatsRepo);
    emit(ChatsCubitLoading());
    final result = await getMassagesUsecase.call();

    emit(ChatsCubitUnreadLoaded(result));
  }

  void createChat({required String receiverId}) async {
    CreateChatUseCase getMassagesUsecase = CreateChatUseCase(
      chatsRepo: chatsRepo,
    );
    emit(ChatsCubitLoading());
    final result = await getMassagesUsecase.call(receiverId: receiverId);
    result.fold(
      (l) => emit(ChatsCubitError(l.message)),
      (r) => emit(NewChat(r)),
    );
  }
}
