import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:round_7_mobile_cure_team4/core/di/di.dart';
import 'package:round_7_mobile_cure_team4/features/call/presentation/cubit/call_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/chat/data/models/message_model.dart';
import 'package:round_7_mobile_cure_team4/features/chat/domain/entities/chat_entity.dart';
import 'package:round_7_mobile_cure_team4/features/chat/presentation/cubits/massages_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/chat/presentation/widgets/chat_conversion_app_bar.dart';
import 'package:round_7_mobile_cure_team4/features/chat/presentation/widgets/image_message_widget.dart';
import 'package:round_7_mobile_cure_team4/features/chat/presentation/widgets/image_picker_sheet.dart';
import 'package:round_7_mobile_cure_team4/features/chat/presentation/widgets/text_message_widget.dart';

import '../../../../core/helper/assets.dart';
import '../../../../core/themes/colors.dart';
import '../../../../core/themes/text_styles.dart';

class ChatConversion extends StatefulWidget {
  final ChatEntity chat;
  const ChatConversion({super.key, required this.chat});

  @override
  State<ChatConversion> createState() => _ChatConversionState();
}

class _ChatConversionState extends State<ChatConversion> {
  final TextEditingController messageController = TextEditingController();
  bool _isSending = false;
  bool _canSend = false;

  @override
  void initState() {
    super.initState();
    messageController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    messageController.removeListener(_onTextChanged);
    messageController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _canSend = messageController.text.trim().isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<MassagesCubit>()
                ..getMassages(receiverId: widget.chat.doctorId),
        ),
        BlocProvider(create: (context) => getIt<CallCubit>()),
      ],
      child: BlocBuilder<MassagesCubit, MassagesState>(
        builder: (context, state) {
          return Scaffold(
            appBar: ChatConversionAppBar(conversation: widget.chat),
            body: state is MassagesLoading
                ? Center(
                    child: SpinKitFadingCircle(
                      color: AppColors.primaryDefault,
                      size: 50.0,
                    ),
                  )
                : state is MassagesLoaded
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    margin: EdgeInsets.only(
                      bottom: 56.h + 32.h + 8.h,
                    ), //floatingActionButton height + padding + space
                    child: ListView.builder(
                      //reverse: true, // Usually chat is reversed, but checking original code it wasn't. Keeping original behavior or fixing? Original wasn't reversed.
                      // Wait, original code had `itemCount: state.massages.length`. If it's not reversed, new messages appear at bottom.
                      // I will keep it standard list for now to match original, but usually chats are reversed.
                      // Original: `itemBuilder` returns Column with `_chatBubble` and `_attachmentBubble`.
                      itemCount: state.massages.length,
                      reverse: true,
                      itemBuilder: (context, index) {
                        final message = state.massages.reversed.toList()[index];
                        return Column(
                          children: [
                            if (message.content != null &&
                                message.content!.isNotEmpty)
                              TextMessageWidget(
                                message: message.content!,
                                isMe: message.isPatient,
                              ),
                            if (message.mediaUrl != null &&
                                message.mediaUrl!.isNotEmpty)
                              ImageMessageWidget(
                                imageUrl: message.mediaUrl!,
                                isMe: message.isPatient,
                              ),
                          ],
                        );
                      },
                    ),
                  )
                : state is MassagesError
                ? Center(child: Text(state.error.message))
                : const Center(child: Text('No messages')),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: _messageInput(context),
          );
        },
      ),
    );
  }

  Widget _messageInput(BuildContext context) {
    // We need the context from BlocBuilder or pass it.
    // Since this is outside BlocBuilder's builder in the original code (it was in floatingActionButton),
    // we need to make sure we have access to the Cubit.
    // The BlocProvider wraps the Scaffold, so context inside build is fine.
    // But `floatingActionButton` uses `_messageInput` which is called with `context` from `build`.
    // However, `BlocProvider` is created INSIDE `build`.
    // Wait, original code: `BlocProvider(create: ..., child: BlocBuilder(..., child: Scaffold(...)))`.
    // So `context` passed to `_messageInput` (if from `build`) is OUTSIDE the provider.
    // We need to use `Builder` or `BlocBuilder`'s context.
    // I will wrap the input in a Builder to be safe or use the context from BlocBuilder if I move it there.
    // Actually, `floatingActionButton` is part of Scaffold, so it needs a context that has the provider.
    // The `BlocBuilder` context has it.

    return Builder(
      builder: (innerContext) {
        return Container(
          width: 1.sw,
          height: 56.h,
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: messageController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(9.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(9.r),
                    ),
                    filled: true,
                    fillColor: AppColors.neutral50,
                    prefixIcon: IconButton(
                      icon: Icon(
                        Icons.camera_alt_outlined,
                        color: AppColors.secondaryDefault,
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (ctx) => ImagePickerSheet(
                            onImageSelected: (XFile image) {
                              _sendImage(innerContext, image);
                            },
                          ),
                        );
                      },
                    ),
                    hintText: "Message",
                    hintStyle: RegularMontserrat.regularMontserrat16.copyWith(
                      color: AppColors.secondaryDefault,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              ElevatedButton(
                onPressed: _canSend && !_isSending
                    ? () => _sendMessage(innerContext)
                    : null,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(48.w, 48.h),
                  backgroundColor: _canSend
                      ? AppColors.primaryDefault
                      : AppColors.neutral300,
                  padding: EdgeInsets.zero,
                ),
                child: _isSending
                    ? SizedBox(
                        width: 20.sp,
                        height: 20.sp,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.sp,
                          color: AppColors.white,
                        ),
                      )
                    : Image.asset(
                        IconsAssets.send,
                        width: 20.sp,
                        height: 20.sp,
                        fit: BoxFit.contain,
                        color: AppColors.white,
                      ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _sendMessage(BuildContext context) async {
    if (_isSending) return;
    setState(() {
      _isSending = true;
    });
    try {
      context.read<MassagesCubit>().sendMessage(
        receiverId: widget.chat.doctorId,
        message: MessageModel(
          content: messageController.text,
          isPatient: true,
          senderUserId: widget.chat.patientId,
          sentAt: DateTime.now().toIso8601String(),
          isRead: false,
        ),
        chatId: widget.chat.id,
      );
      // Refresh messages
      context.read<MassagesCubit>().getMassages(
        receiverId: widget.chat.doctorId,
      );

      messageController.clear();
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to send')));
    } finally {
      setState(() {
        _isSending = false;
      });
    }
  }

  Future<void> _sendImage(BuildContext context, XFile image) async {
    try {
      await context.read<MassagesCubit>().sendImageMessage(
        receiverId: widget.chat.doctorId,
        chatId: widget.chat.id,
        senderId: widget.chat.patientId,
        imageFile: image,
      );
      context.read<MassagesCubit>().getMassages(
        receiverId: widget.chat.doctorId,
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to send image')));
    }
  }
}
