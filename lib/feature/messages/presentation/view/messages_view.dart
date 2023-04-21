import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_chat_app/core/constants/app_content_texts.dart';
import 'package:simple_chat_app/core/constants/padding_constants.dart';
import 'package:simple_chat_app/core/dependency_injection/di.dart';
import 'package:simple_chat_app/core/router/route_management.gr.dart';
import 'package:simple_chat_app/core/theme/app_colors.dart';
import 'package:simple_chat_app/core/theme/custom_text_styles.dart';
import 'package:simple_chat_app/core/utils/message_listener/listen_messages.dart';
import 'package:simple_chat_app/core/widgets/custom_scaffold.dart';
import 'package:simple_chat_app/core/widgets/home_app_bar.dart';
import 'package:simple_chat_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:simple_chat_app/feature/messages/data/model/message_model.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const HomeAppBar(
        title: AppContentTexts.messages,
      ),
      body: BlocProvider.value(
        value: sl<HomeBloc>()
          ..add(const HomeEvent.getUserModel())
          ..add(const HomeEvent.updateFcmToken()),
        child: StreamBuilder<List<MessageModel>>(
          stream: ListenMessages.getMessages(),
          builder: (context, snapshot) {
            final messages = snapshot.data?.toList();
            return messages == null || messages.isEmpty
                ? Center(
                    child: Text(
                      'Not available messages at the moment',
                      style: CustomTextStyles.mediumText.copyWith(
                        color: AppColors.blackColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                : ListView.separated(
                    padding: PaddingConstants.generalPadding,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      var count = 0;
                      if (message.contents != null) {
                        for (final element in message.contents!) {
                          if (!(element.isRead ?? false)) {
                            count++;
                          }
                        }
                      }
                      return InkWell(
                        onTap: () {
                          if (message.fromWho != null) {
                            context.router.push(
                              MessageDetailRoute(
                                userModel: message.fromWho!,
                              ),
                            );
                          }
                        },
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 20.h,
                              foregroundImage: NetworkImage(
                                message.fromWho?.photoUrl ?? '',
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  message.fromWho?.name ?? '',
                                  style: CustomTextStyles.mediumText,
                                ),
                                Text(
                                  message.contents?.last.text ?? '',
                                  style: CustomTextStyles.smallText.copyWith(
                                    color: AppColors.greyColor,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            if (count > 0)
                              CircleAvatar(
                                radius: 10.h,
                                backgroundColor: Colors.red,
                                child: Text(
                                  count.toString(),
                                  style: CustomTextStyles.smallText.copyWith(
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(
                      color: AppColors.greyColor,
                    ),
                    itemCount: messages.length,
                  );
          },
        ),
      ),
    );
  }
}
