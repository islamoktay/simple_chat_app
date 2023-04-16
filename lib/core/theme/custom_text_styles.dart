import 'package:flutter/material.dart';
import 'package:simple_chat_app/core/constants/fonts.gen.dart';
import 'package:simple_chat_app/core/theme/app_colors.dart';

class CustomTextStyles {
  static const authTitleStyle = TextStyle(
    fontSize: 32,
    fontFamily: FontFamily.gilroyRegular,
    color: AppColors.beigeColor,
    fontWeight: FontWeight.w900,
  );

  static const mediumText = TextStyle(
    fontSize: 22,
    fontFamily: FontFamily.gilroyRegular,
    color: AppColors.blackColor,
  );

  static const smallText = TextStyle(
    fontSize: 16,
    fontFamily: FontFamily.gilroyRegular,
    color: AppColors.blackColor,
  );
}
