part of 'chats_cubit_cubit.dart';

abstract class ChatsCubitState {}

class ChatsCubitInitial extends ChatsCubitState {}

class ChatsCubitLoading extends ChatsCubitState {}

class ChatsCubitLoaded extends ChatsCubitState {
  final List<ChatEntity> chats;
  ChatsCubitLoaded(this.chats);
}

class ChatsCubitUnreadLoaded extends ChatsCubitState {
  final List<ChatEntity> chats;
  ChatsCubitUnreadLoaded(this.chats);
}

class ChatsCubitError extends ChatsCubitState {
  final String message;
  ChatsCubitError(this.message);
}

class SearchLoaded extends ChatsCubitState {
  final List<ChatEntity> chats;
  SearchLoaded(this.chats);
}

class Searching extends ChatsCubitState {}

class NewChat extends ChatsCubitState {
  final ChatEntity chat;
  NewChat(this.chat);
}
