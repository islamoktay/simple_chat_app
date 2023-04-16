import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_chat_app/core/constants/assets.gen.dart';
import 'package:simple_chat_app/core/dependency_injection/di.dart';
import 'package:simple_chat_app/core/theme/app_colors.dart';
import 'package:simple_chat_app/core/widgets/custom_scaffold.dart';
import 'package:simple_chat_app/feature/splash/presentation/cubit/splash_cubit.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<SplashCubit>()..appStartFunctions(),
      child: CustomScaffold(
        bgColor: AppColors.lightPurpleColor,
        body: Center(
          child: Assets.icons.launcherIcon.image(),
        ),
      ),
    );
  }
}
