import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_chat_app/core/constants/app_content_texts.dart';
import 'package:simple_chat_app/core/router/route_management.gr.dart';
import 'package:simple_chat_app/core/theme/app_colors.dart';
import 'package:simple_chat_app/feature/home/presentation/widgets/custom_nav_bar_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      routes: const [
        DiscoverRoute(),
        MessagesRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.lightPinkColor.withOpacity(.5),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: AppColors.blackColor.withOpacity(.1),
              ),
            ],
          ),
          height: 100.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomNavBarItem(
                onTap: () => tabsRouter.setActiveIndex(0),
                isChosen: tabsRouter.activeIndex == 0,
                icon: Icons.travel_explore,
                title: AppContentTexts.discover,
              ),
              CustomNavBarItem(
                onTap: () => tabsRouter.setActiveIndex(1),
                isChosen: tabsRouter.activeIndex == 1,
                icon: Icons.forum,
                title: AppContentTexts.messages,
              ),
            ],
          ),
        );
      },
    );
  }
}
