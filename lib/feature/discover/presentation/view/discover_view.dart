import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_chat_app/core/constants/app_content_texts.dart';
import 'package:simple_chat_app/core/constants/padding_constants.dart';
import 'package:simple_chat_app/core/dependency_injection/di.dart';
import 'package:simple_chat_app/core/router/route_management.gr.dart';
import 'package:simple_chat_app/core/theme/app_colors.dart';
import 'package:simple_chat_app/core/theme/custom_text_styles.dart';
import 'package:simple_chat_app/core/widgets/custom_scaffold.dart';
import 'package:simple_chat_app/core/widgets/home_app_bar.dart';
import 'package:simple_chat_app/feature/home/presentation/bloc/home_bloc.dart';

class DiscoverView extends StatelessWidget {
  const DiscoverView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const HomeAppBar(
        title: AppContentTexts.discover,
      ),
      body: BlocProvider.value(
        value: sl<HomeBloc>()..add(const HomeEvent.getUsers()),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.users.isEmpty) {
              return Center(
                child: Text(
                  'There is no user at the moment',
                  style: CustomTextStyles.mediumText.copyWith(
                    color: AppColors.blackColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              return RefreshIndicator(
                onRefresh: () async => sl<HomeBloc>().add(
                  const HomeEvent.getUsers(),
                ),
                child: ListView.separated(
                  padding: PaddingConstants.generalPadding,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => context.router.push(
                        MessageDetailRoute(
                          userModel: state.users[index],
                        ),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20.h,
                            foregroundImage: NetworkImage(
                              state.users[index].photoUrl ?? '',
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            state.users[index].name ?? '',
                            style: CustomTextStyles.mediumText,
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.send,
                            color: AppColors.lightPurpleColor,
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(
                    color: AppColors.greyColor,
                  ),
                  itemCount: state.users.length,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
