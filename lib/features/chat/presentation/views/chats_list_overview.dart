// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:round_7_mobile_cure_team4/core/di/di.dart';
import 'package:round_7_mobile_cure_team4/core/routes/app_router.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';
import 'package:round_7_mobile_cure_team4/features/chat/domain/entities/chat_entity.dart';
import 'package:round_7_mobile_cure_team4/features/chat/presentation/cubits/chats_cubit_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/chat/presentation/widgets/chat_list_options.dart';

import '../../../../core/helper/assets.dart';
import '../widgets/chat_overview_app_bar.dart';
/*
// test model
class MockChatCardModel {
  final String name;
  final String message;
  final String time;
  final String image;
  final int unreadMessageCount;
  bool isSelected;

  MockChatCardModel({
    required this.name,
    required this.message,
    required this.time,
    required this.image,
    required this.unreadMessageCount,
    this.isSelected = false,
  });
}

// test list data
List<MockChatCardModel> mockChatCardModelList = [
  MockChatCardModel(
    name: 'John Doe',
    message: 'Hello, how are you?',
    time: '2:30 PM',
    image:
        "https://cdn.pixabay.com/photo/2024/08/18/04/44/ai-generated-8976950_1280.png",
    unreadMessageCount: 2,
  ),
  MockChatCardModel(
    name: 'Jane Doe',
    message: 'Hi, how can I help you?',
    time: '1:45 PM',
    image:
        "https://cdn.pixabay.com/photo/2024/08/18/04/44/ai-generated-8976950_1280.png",
    unreadMessageCount: 1,
  ),
  MockChatCardModel(
    name: 'Bob Smith',
    message: 'Good morning!',
    time: '9:15 AM',
    image:
        "https://cdn.pixabay.com/photo/2024/08/18/04/44/ai-generated-8976950_1280.png",
    unreadMessageCount: 0,
  ),
  MockChatCardModel(
    name: 'Alice Johnson',
    message: 'I need some help with my project.',
    time: '4:30 PM',
    image:
        "https://cdn.pixabay.com/photo/2024/08/18/04/44/ai-generated-8976950_1280.png",
    unreadMessageCount: 3,
  ),
];*/

class ChatsListOverview extends StatefulWidget {
  const ChatsListOverview({super.key});

  @override
  State<ChatsListOverview> createState() => _ChatsListOverviewState();
}

class _ChatsListOverviewState extends State<ChatsListOverview> {
  bool isSearch = false;
  List<ChatEntity> selectedChats = [];
  _formatDate(DateTime date) => DateFormat('hh:mm a').format(date);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ChatsCubit>()..getChats(),
      child: BlocBuilder<ChatsCubit, ChatsCubitState>(
        builder: (context, state) {
          if (state is ChatsCubitError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.error, color: AppColors.error500, size: 50.sp),
                Text(state.message, style: RegularGeorgia.regularGeorgia16),
              ],
            );
          } else {
            return Scaffold(
              appBar: ChatOverviewAppBar(
                isSearch: isSearch,
                title: isSearch ? 'Search' : appbartitle(state),
                selectedCount: selectedChats.length,
                isSelected: selectedChats.isNotEmpty,
                onBack: () => setState(() {
                  isSearch = false;
                  selectedChats = [];
                  FocusScope.of(context).unfocus();
                }),
              ),
              body: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  children: [
                    TextField(
                      onSubmitted: (value) {
                        setState(() {
                          isSearch = false;
                        });
                      },
                      onChanged: (value) {
                        context.read<ChatsCubit>().searchChats(query: value);
                      },
                      onTap: () {
                        setState(() {
                          isSearch = true;
                        });
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.neutral50,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppColors.neutralDefault,
                        ),
                        hintText: 'Search for chat, doctor',
                        hintStyle: RegularMontserrat.regularMontserrat14,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    isSearch
                        ? chatSearchStateBuilder()
                        : chatOverviewStateBuilder(state),
                    SizedBox(height: 16.h),

                    Expanded(
                      child: state is ChatsCubitLoading
                          ? const Center(child: CircularProgressIndicator())
                          : state is ChatsCubitUnreadLoaded ||
                                state is ChatsCubitLoaded &&
                                    state.chats.isNotEmpty
                          ? ListView.builder(
                              itemCount: state is ChatsCubitUnreadLoaded
                                  ? state.chats.length
                                  : state is ChatsCubitLoaded
                                  ? state.chats.length
                                  : 0,
                              itemBuilder: (context, index) {
                                if (state is ChatsCubitUnreadLoaded) {
                                  return _chatCard(state.chats[index], index);
                                } else if (state is ChatsCubitLoaded) {
                                  return _chatCard(state.chats[index], index);
                                } else {
                                  return Container();
                                }
                              },
                            )
                          : Center(
                              child: Text(
                                "You don't have any chats",
                                style: RegularMontserrat.regularMontserrat14
                                    .copyWith(color: AppColors.neutral900),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget chatOverviewStateBuilder(ChatsCubitState state) {
    return Row(
      children: [
        ChatListOptions(title: 'All', isSelected: state is ChatsCubitLoaded),
        SizedBox(width: 8.w),
        ChatListOptions(
          title: 'Unread',
          isSelected: state is ChatsCubitUnreadLoaded,
        ),
        //SizedBox(width: 8.w),
        // ChatListOptions(title: 'Favorite'),
      ],
    );
  }

  Widget chatSearchStateBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "history",
          style: RegularGeorgia.regularGeorgia24.copyWith(
            color: AppColors.secondaryDefault,
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: AppColors.neutral900, width: 1),
                minimumSize: Size(110.w, 36.h),
              ),
              child: Row(
                children: [
                  Image.asset(
                    IconsAssets.history,
                    width: 20.sp,
                    height: 20.sp,
                    fit: BoxFit.contain,
                    color: AppColors.neutral900,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'robert',
                    style: RegularMontserrat.regularMontserrat16.copyWith(
                      color: AppColors.neutral900,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: AppColors.neutral900, width: 1),
                minimumSize: Size(110.w, 36.h),
              ),
              child: Row(
                children: [
                  Image.asset(
                    IconsAssets.history,
                    width: 20.sp,
                    height: 20.sp,
                    fit: BoxFit.contain,
                    color: AppColors.neutral900,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'jessica',
                    style: RegularMontserrat.regularMontserrat16.copyWith(
                      color: AppColors.neutral900,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _chatCard(ChatEntity chat, int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.neutral50,
        borderRadius: BorderRadius.circular(13.r),
        border: selectedChats.isNotEmpty && selectedChats.contains(chat)
            ? Border.all(color: AppColors.neutral200, width: 1.sp)
            : null,
      ),
      child: ListTile(
        minTileHeight: 120.h,
        title: Row(
          children: [
            Text(chat.doctorName, style: MediumMontserrat.mediumMontserrat16),
            Spacer(),
            Text(
              overflow: TextOverflow.ellipsis,
              _formatDate(chat.lastReadAt!),
              style: MediumMontserrat.mediumMontserrat14.copyWith(
                color: AppColors.success500,
              ),
            ),
          ],
        ),
        subtitle: Row(
          children: [
            Text(
              chat.lastMessageContent,
              style: RegularMontserrat.regularMontserrat14.copyWith(
                color: AppColors.neutralDefault,
              ),
            ),
            Spacer(),
            chat.unReadMessages > 0
                ? Container(
                    width: 20.sp,
                    height: 20.sp,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                    child: Center(
                      child: Text(
                        chat.unReadMessages.toString(),
                        style: RegularMontserrat.regularMontserrat12.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),

        onTap: () {
          if (selectedChats.isNotEmpty) {
            setState(() {
              selectedChats.removeWhere((card) => card == chat);
            });
          } else {
            context.push(AppRoutes.chatConversion, extra: chat);
          }
        },
        onLongPress: () {
          setState(() {
            selectedChats.add(chat);
          });
        },
        contentPadding: EdgeInsets.zero,
        //minLeadingWidth: 60.w,
        leading: ClipOval(
          clipBehavior: Clip.hardEdge,
          child: Image.network(
            chat.img,
            width: 60.h,
            height: 60.h,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 60.h,
                height: 60.h,
                color: AppColors.secondary100,
                child: Icon(Icons.person, color: AppColors.white, size: 40.sp),
              );
            },
          ),
        ),
      ),
    );
  }
}

String appbartitle(ChatsCubitState state) {
  if (state is ChatsCubitLoaded) {
    return 'Chat';
  } else if (state is ChatsCubitUnreadLoaded) {
    return 'Unread';
  } else {
    return '';
  }
}
