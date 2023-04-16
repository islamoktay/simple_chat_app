import 'package:flutter/material.dart';
import 'package:simple_chat_app/core/constants/app_content_texts.dart';
import 'package:simple_chat_app/core/theme/app_colors.dart';
import 'package:simple_chat_app/core/theme/custom_text_styles.dart';

class OrLoginWithBody extends StatelessWidget {
  const OrLoginWithBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: AppColors.greyColor,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            AppContentTexts.orLoginWith,
            style: CustomTextStyles.smallText,
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: AppColors.greyColor,
          ),
        ),
      ],
    );
  }
}
