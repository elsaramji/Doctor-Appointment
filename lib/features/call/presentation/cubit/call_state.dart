part of 'call_cubit.dart';

abstract class CallState {}

class CallInitial extends CallState {}

class CallOutgoing extends CallState {} // Ringing (Outgoing)

class CallIncoming extends CallState {} // Ringing (Incoming)

class CallConnected extends CallState {
  final bool isVideo;
  CallConnected({required this.isVideo});
}

class CallEnded extends CallState {}

class CallError extends CallState {
  final String message;
  CallError(this.message);
}
