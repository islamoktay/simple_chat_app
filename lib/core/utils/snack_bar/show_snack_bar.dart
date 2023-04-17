import 'package:flutter/material.dart';
import 'package:simple_chat_app/core/constants/border_radius_constants.dart';
import 'package:simple_chat_app/core/constants/padding_constants.dart';
import 'package:simple_chat_app/core/theme/app_colors.dart';
import 'package:simple_chat_app/core/theme/custom_text_styles.dart';
import 'package:simple_chat_app/core/utils/snack_bar/global_variable.dart';

void customSnackBar({
  required String content,
  bool isWarning = true,
}) {
  GlobalVariable.scaffoldMessengerKey.currentState!.showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 1),
      margin: const EdgeInsets.only(bottom: 64),
      backgroundColor: Colors.transparent,
      content: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: AppColors.blackColor.withOpacity(.1),
            ),
          ],
          borderRadius: BorderRadiusConstants.generalRadius,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: isWarning ? AppColors.redColor : AppColors.greenColor,
            borderRadius: BorderRadiusConstants.generalRadius,
          ),
          child: Padding(
            padding: PaddingConstants.generalPadding,
            child: Row(
              children: [
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    content,
                    style: CustomTextStyles.smallText
                        .copyWith(color: AppColors.whiteColor),
                    maxLines: 6,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
    ),
  );
}
