import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/call/services/webrtc_service.dart';

part 'call_state.dart';

@injectable
class CallCubit extends Cubit<CallState> {
  final WebRTCService _service;

  final RTCVideoRenderer localRenderer = RTCVideoRenderer();
  final RTCVideoRenderer remoteRenderer = RTCVideoRenderer();

  StreamSubscription? _localStreamSub;
  StreamSubscription? _remoteStreamSub;
  StreamSubscription? _stateSub;

  String? _sessionId;
  bool _isMicMuted = false;
  bool _isCameraOff = false;

  CallCubit(this._service) : super(CallInitial()) {
    _initRenderers();
    _listenToService();
  }

  Future<void> _initRenderers() async {
    await localRenderer.initialize();
    await remoteRenderer.initialize();
  }

  void _listenToService() {
    _localStreamSub = _service.onLocalStream.listen((stream) {
      localRenderer.srcObject = stream;
    });

    _remoteStreamSub = _service.onRemoteStream.listen((stream) {
      remoteRenderer.srcObject = stream;
    });

    _stateSub = _service.onCallStateChanged.listen((state) {
      switch (state) {
        case CallStateEnum.connecting:
          // Stay in current state or show loading?
          break;
        case CallStateEnum.ringing:
          emit(CallOutgoing());
          break;
        case CallStateEnum.connected:
          // Determine if video based on stream tracks or passed arg?
          // For now assume video if local renderer has video track
          bool isVideo =
              localRenderer.srcObject?.getVideoTracks().isNotEmpty ?? false;
          emit(CallConnected(isVideo: isVideo));
          break;
        case CallStateEnum.ended:
          emit(CallEnded());
          _cleanup();
          break;
        case CallStateEnum.error:
          emit(CallError("An error occurred"));
          break;
        default:
          break;
      }
    });
  }

  Future<void> startVoiceCall(String receiverId) async {
    try {
      emit(CallOutgoing());
      await _service.makeCall(receiverId, false);
    } catch (e) {
      emit(CallError(e.toString()));
    }
  }

  Future<void> startVideoCall(String receiverId) async {
    try {
      emit(CallOutgoing());
      await _service.makeCall(receiverId, true);
    } catch (e) {
      emit(CallError(e.toString()));
    }
  }

  Future<void> accept(String sessionId, String answerSdp) async {
    try {
      _sessionId = sessionId;
      await _service.setRemoteAnswer(answerSdp);
    } catch (e) {
      emit(CallError(e.toString()));
    }
  }

  Future<void> end() async {
    try {
      await _service.endCall(_sessionId ?? '');
    } catch (_) {
      emit(CallEnded());
    }
  }

  void toggleMic() {
    _isMicMuted = !_isMicMuted;
    _service.toggleMic(_isMicMuted);
  }

  void toggleCamera() {
    _isCameraOff = !_isCameraOff;
    _service.toggleCamera(!_isCameraOff);
  }

  void switchCamera() {
    _service.switchCamera();
  }

  void _cleanup() {
    localRenderer.srcObject = null;
    remoteRenderer.srcObject = null;
  }

  @override
  Future<void> close() {
    _localStreamSub?.cancel();
    _remoteStreamSub?.cancel();
    _stateSub?.cancel();
    localRenderer.dispose();
    remoteRenderer.dispose();
    return super.close();
  }
}
