part of 'massages_cubit.dart';

abstract class MassagesState {}

class MassagesInitial extends MassagesState {}

class MassagesLoaded extends MassagesState {
  final List<MessageEntity> massages;
  MassagesLoaded({required this.massages});
}

class MassagesLoading extends MassagesState {}

class MassagesError extends MassagesState {
  final ApplicationError error;
  MassagesError({required this.error});
}

class MassagesSent extends MassagesState {}
class MassagesSentFailed extends MassagesState {}