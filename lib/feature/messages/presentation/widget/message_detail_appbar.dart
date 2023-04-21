import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_chat_app/core/theme/app_colors.dart';
import 'package:simple_chat_app/core/theme/custom_text_styles.dart';
import 'package:simple_chat_app/feature/home/data/model/user_model.dart';

class MessageDetailAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const MessageDetailAppBar({
    required this.user,
    super.key,
  });
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.lightPinkColor.withOpacity(.5),
      leading: InkWell(
        onTap: () => context.router.pop(),
        child: Icon(
          Icons.arrow_back,
          color: AppColors.lightPurpleColor,
          size: 30.h,
        ),
      ),
      title: Row(
        children: [
          CircleAvatar(
            radius: 20.h,
            foregroundImage: NetworkImage(user.photoUrl ?? ''),
          ),
          SizedBox(width: 10.w),
          Text(
            user.name ?? '',
            style: CustomTextStyles.mediumText.copyWith(
              color: AppColors.blackColor,
            ),
          ),
        ],
      ),
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
