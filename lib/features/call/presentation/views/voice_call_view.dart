import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:round_7_mobile_cure_team4/core/di/di.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';
import 'package:round_7_mobile_cure_team4/features/call/presentation/cubit/call_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/chat/domain/entities/chat_entity.dart';

class VoiceCallView extends StatefulWidget {
  final ChatEntity conversation;
  const VoiceCallView({super.key, required this.conversation});

  @override
  State<VoiceCallView> createState() => _VoiceCallViewState();
}

class _VoiceCallViewState extends State<VoiceCallView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<CallCubit>()..startVoiceCall(widget.conversation.doctorId),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: AppColors.white,
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

                return SafeArea(
                  child: Column(
                    children: [
                      SizedBox(height: 60.h),
                      CircleAvatar(
                        radius: 60.sp,
                        backgroundColor: AppColors.secondary100,
                        child: Text(
                          widget.conversation.doctorName[0].toUpperCase(),
                          style: TextStyle(
                            fontSize: 40.sp,
                            color: AppColors.primaryDefault,
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        widget.conversation.doctorName,
                        style: RegularGeorgia.regularGeorgia24,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        state is CallConnected ? 'Connected' : 'Calling...',
                        style: RegularMontserrat.regularMontserrat16.copyWith(
                          color: AppColors.secondaryDefault,
                        ),
                      ),
                      Spacer(),

                      if (state is CallOutgoing)
                        SpinKitPulse(
                          color: AppColors.primaryDefault,
                          size: 60.0,
                        ),

                      Spacer(),

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                          vertical: 40.h,
                        ),
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
                              icon: Icons.volume_up,
                              color: AppColors.secondaryDefault,
                              onPressed: () {
                                // Toggle speaker logic if needed
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
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
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
        iconSize: 28.sp,
        padding: EdgeInsets.all(16.w),
      ),
    );
  }
}
