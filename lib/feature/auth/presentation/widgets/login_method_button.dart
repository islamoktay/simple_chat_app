import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_chat_app/core/constants/border_radius_constants.dart';
import 'package:simple_chat_app/core/constants/login_method_constants.dart';
import 'package:simple_chat_app/core/theme/app_colors.dart';
import 'package:simple_chat_app/core/theme/custom_text_styles.dart';

class LoginMethodButton extends StatelessWidget {
  const LoginMethodButton({
    required this.loginMethodModel,
    super.key,
  });
  final LoginMethodModel loginMethodModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: loginMethodModel.onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.greyColor,
          ),
          borderRadius: BorderRadiusConstants.generalRadius,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30.h,
              width: 30.h,
              child: loginMethodModel.icon,
            ),
            SizedBox(width: 10.w),
            Text(
              loginMethodModel.title,
              style: CustomTextStyles.smallText,
            )
          ],
        ),
      ),
    );
  }
}
