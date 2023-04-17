import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_chat_app/core/theme/app_colors.dart';
import 'package:simple_chat_app/core/theme/custom_text_styles.dart';

class AuthTitleBody extends StatelessWidget {
  const AuthTitleBody({
    required this.title,
    this.isBackButton = false,
    super.key,
  });
  final String title;
  final bool isBackButton;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.darkPurpleColor,
          height: 200.h,
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            height: 350.h,
            width: 350.w,
            decoration: BoxDecoration(
              color: AppColors.lightPurpleColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(350.h),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 24.h,
          left: 16.w,
          child: Text(
            title,
            style: CustomTextStyles.authTitleStyle,
          ),
        ),
        if (isBackButton)
          Positioned(
            top: 16.h + MediaQuery.of(context).padding.top,
            left: 16.w,
            child: InkWell(
              onTap: () => context.router.pop(),
              child: const Icon(
                Icons.arrow_back,
                color: AppColors.beigeColor,
              ),
            ),
          ),
      ],
    );
  }
}
