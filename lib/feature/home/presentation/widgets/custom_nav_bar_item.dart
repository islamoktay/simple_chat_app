import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_chat_app/core/theme/app_colors.dart';
import 'package:simple_chat_app/core/theme/custom_text_styles.dart';

class CustomNavBarItem extends StatelessWidget {
  const CustomNavBarItem({
    required this.onTap,
    required this.isChosen,
    required this.icon,
    required this.title,
    super.key,
  });
  final VoidCallback onTap;
  final bool isChosen;
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isChosen ? AppColors.lightPurpleColor : AppColors.greyColor,
            size: 30.h,
          ),
          Text(
            title,
            style: CustomTextStyles.smallText.copyWith(
              color:
                  isChosen ? AppColors.lightPurpleColor : AppColors.greyColor,
            ),
          )
        ],
      ),
    );
  }
}
