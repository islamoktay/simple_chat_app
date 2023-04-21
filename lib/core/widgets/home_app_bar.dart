import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_chat_app/core/constants/padding_constants.dart';
import 'package:simple_chat_app/core/dependency_injection/di.dart';
import 'package:simple_chat_app/core/theme/app_colors.dart';
import 'package:simple_chat_app/core/theme/custom_text_styles.dart';
import 'package:simple_chat_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:simple_chat_app/feature/home/presentation/bloc/home_bloc.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    required this.title,
    super.key,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<HomeBloc>(),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
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
            leading: state.userModel?.photoUrl?.isEmpty ?? false
                ? Icon(
                    Icons.account_circle_outlined,
                    color: AppColors.lightPurpleColor,
                    size: 30.h,
                  )
                : Padding(
                    padding: PaddingConstants.smallPadding,
                    child: CircleAvatar(
                      radius: 20.h,
                      foregroundImage: NetworkImage(
                        state.userModel?.photoUrl ?? '',
                      ),
                    ),
                  ),
            title: Text(
              title,
              style: CustomTextStyles.mediumText.copyWith(
                color: AppColors.blackColor,
              ),
            ),
            centerTitle: false,
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
