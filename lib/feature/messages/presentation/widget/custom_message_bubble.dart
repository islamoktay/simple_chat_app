import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:simple_chat_app/core/dependency_injection/di.dart';
import 'package:simple_chat_app/core/theme/app_colors.dart';
import 'package:simple_chat_app/core/theme/custom_text_styles.dart';
import 'package:simple_chat_app/core/utils/dates/date_util.dart';
import 'package:simple_chat_app/feature/messages/data/model/content_model.dart';

class CustomMessageBubble extends StatelessWidget {
  const CustomMessageBubble({
    required this.isMe,
    required this.content,
    super.key,
  });

  final bool isMe;
  final ContentModel content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Bubble(
          margin: const BubbleEdges.only(top: 10),
          stick: true,
          nip: isMe ? BubbleNip.rightBottom : BubbleNip.leftBottom,
          color: isMe ? AppColors.lightPinkColor : AppColors.lightPurpleColor,
          child: Text(
            content.text ?? '',
            style: CustomTextStyles.mediumText.copyWith(
              color: isMe ? AppColors.blackColor : AppColors.whiteColor,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          sl<DateUtil>().hourAndMinute(dateTime: content.createdAt) ?? '',
          style: CustomTextStyles.smallText.copyWith(
            color: AppColors.greyColor,
          ),
        )
      ],
    );
  }
}
