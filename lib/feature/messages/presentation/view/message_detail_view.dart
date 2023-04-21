import 'package:flutter/material.dart';
import 'package:simple_chat_app/core/widgets/custom_scaffold.dart';
import 'package:simple_chat_app/feature/home/data/model/user_model.dart';
import 'package:simple_chat_app/feature/messages/presentation/widget/message_detail_appbar.dart';
import 'package:simple_chat_app/feature/messages/presentation/widget/message_input_area.dart';
import 'package:simple_chat_app/feature/messages/presentation/widget/messages_stream_body.dart';

class MessageDetailView extends StatelessWidget {
  const MessageDetailView({
    required this.userModel,
    super.key,
  });
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: MessageDetailAppBar(user: userModel),
      body: Stack(
        children: [
          MessagesStreamBody(userModel: userModel),
          MessageInputArea(userModel: userModel),
        ],
      ),
    );
  }
}
