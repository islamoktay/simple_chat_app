import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_chat_app/core/dependency_injection/di.dart';
import 'package:simple_chat_app/core/theme/app_colors.dart';
import 'package:simple_chat_app/core/theme/custom_text_styles.dart';
import 'package:simple_chat_app/feature/auth/presentation/bloc/auth_bloc.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    required this.title,
    super.key,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.lightPinkColor.withOpacity(.5),
      actions: [
        InkWell(
          onTap: () => sl<AuthBloc>().add(const AuthEvent.logout()),
          child: Padding(
            padding: EdgeInsets.only(right: 16.h),
            child: const Icon(
              Icons.logout,
              color: AppColors.lightPurpleColor,
            ),
          ),
        )
      ],
      leading: Icon(
        Icons.account_circle_outlined,
        color: AppColors.lightPurpleColor,
        size: 30.h,
      ),
      title: Text(
        title,
        style: CustomTextStyles.mediumText.copyWith(
          color: AppColors.blackColor,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
