import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_chat_app/core/constants/padding_constants.dart';
import 'package:simple_chat_app/core/dependency_injection/di.dart';
import 'package:simple_chat_app/core/utils/message_listener/listen_messages.dart';
import 'package:simple_chat_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:simple_chat_app/feature/home/data/model/user_model.dart';
import 'package:simple_chat_app/feature/messages/data/model/content_model.dart';
import 'package:simple_chat_app/feature/messages/presentation/widget/custom_message_bubble.dart';

class MessagesStreamBody extends StatelessWidget {
  const MessagesStreamBody({
    required this.userModel,
    super.key,
  });

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      bottom: MediaQuery.of(context).viewPadding.bottom + 70.h,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: StreamBuilder<List<ContentModel>>(
            stream:
                ListenMessages.getUserMessage(uid: userModel.uid ?? ''),
            builder: (context, snapshot) {
              final contents = snapshot.data?.reversed.toList();
              if (contents?.isEmpty ?? false) {
                return const SizedBox.shrink();
              } else {
                return ListView.builder(
                  padding: PaddingConstants.generalPadding,
                  shrinkWrap: true,
                  reverse: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: contents?.length,
                  itemBuilder: (context, index) {
                    return CustomMessageBubble(
                      isMe: sl<AuthBloc>().state.uid ==
                          contents?[index].uid,
                      content: contents?[index] ?? ContentModel(),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
