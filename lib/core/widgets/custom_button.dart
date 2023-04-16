
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_chat_app/core/constants/border_radius_constants.dart';
import 'package:simple_chat_app/core/theme/app_colors.dart';
import 'package:simple_chat_app/core/theme/custom_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.text,
    required this.onTap,
    super.key,
  });
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          color: AppColors.lightPurpleColor,
          borderRadius: BorderRadiusConstants.generalRadius,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: CustomTextStyles.mediumText.copyWith(
            color: AppColors.beigeColor,
          ),
        ),
      ),
    );
  }
}
