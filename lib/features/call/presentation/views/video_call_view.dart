import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:round_7_mobile_cure_team4/core/di/di.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';
import 'package:round_7_mobile_cure_team4/features/call/presentation/cubit/call_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/chat/domain/entities/chat_entity.dart';

class VideoCallView extends StatefulWidget {
  final ChatEntity conversation;
  const VideoCallView({super.key, required this.conversation});

  @override
  State<VideoCallView> createState() => _VideoCallViewState();
}

class _VideoCallViewState extends State<VideoCallView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<CallCubit>()..startVideoCall(widget.conversation.doctorId),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: AppColors.secondary100,
            body: BlocConsumer<CallCubit, CallState>(
              listener: (context, state) {
                if (state is CallEnded) {
                  Navigator.of(context).pop();
                }
                if (state is CallError) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                  Navigator.of(context).pop();
                }
              },
              builder: (context, state) {
                final cubit = context.read<CallCubit>();

                if (state is CallOutgoing) {
                  return _buildOutgoingUI(context);
                }

                if (state is CallConnected) {
                  return Stack(
                    children: [
                      // Remote Video (Fullscreen)
                      Positioned.fill(
                        child: RTCVideoView(
                          cubit.remoteRenderer,
                          objectFit:
                              RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
                        ),
                      ),

                      // Local Video (PiP)
                      Positioned(
                        right: 16.w,
                        bottom: 120.h,
                        child: Container(
                          width: 100.w,
                          height: 150.h,
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                              color: AppColors.white,
                              width: 2,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: RTCVideoView(
                              cubit.localRenderer,
                              mirror: true,
                              objectFit: RTCVideoViewObjectFit
                                  .RTCVideoViewObjectFitCover,
                            ),
                          ),
                        ),
                      ),

                      // Controls
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 32.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildControlBtn(
                              icon: Icons.mic_off,
                              color: AppColors.secondaryDefault,
                              onPressed: () => cubit.toggleMic(),
                            ),
                            _buildControlBtn(
                              icon: Icons.call_end,
                              color: Colors.red,
                              onPressed: () => cubit.end(),
                            ),
                            _buildControlBtn(
                              icon: Icons.cameraswitch,
                              color: AppColors.secondaryDefault,
                              onPressed: () => cubit.switchCamera(),
                            ),
                            _buildControlBtn(
                              icon: Icons.videocam_off,
                              color: AppColors.secondaryDefault,
                              onPressed: () => cubit.toggleCamera(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }

                return Center(
                  child: SpinKitPulse(color: AppColors.white, size: 50.0),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildOutgoingUI(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.secondary100, AppColors.secondaryDefault],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60.r,
            backgroundColor: AppColors.neutral300,
            child: Text(
              widget.conversation.doctorName[0].toUpperCase(),
              style: TextStyle(fontSize: 40.sp, color: AppColors.white),
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            widget.conversation.doctorName,
            style: RegularGeorgia.regularGeorgia24.copyWith(
              color: AppColors.white,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "Calling...",
            style: RegularMontserrat.regularMontserrat16.copyWith(
              color: AppColors.secondary100,
            ),
          ),
          SizedBox(height: 100.h),
          SpinKitPulse(color: AppColors.white, size: 60.0),
          SizedBox(height: 100.h),
          FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () => context.read<CallCubit>().end(),
            child: Icon(Icons.call_end, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildControlBtn({
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
        iconSize: 28.sp,
        padding: EdgeInsets.all(12.w),
      ),
    );
  }
}
