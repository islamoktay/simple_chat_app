import 'package:flutter/material.dart';
import 'package:simple_chat_app/core/constants/assets.gen.dart';
import 'package:simple_chat_app/core/dependency_injection/di.dart';
import 'package:simple_chat_app/core/router/route_management.gr.dart';
import 'package:simple_chat_app/core/router/router_path.dart';
import 'package:simple_chat_app/core/theme/app_colors.dart';
import 'package:simple_chat_app/feature/auth/presentation/bloc/auth_bloc.dart';

class LoginMethodModel {
  const LoginMethodModel({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final Widget icon;
  final String title;
  final VoidCallback onTap;
}

class LoginMethods {
  static const List<String> methodTexts = [
    'Anonymous',
    'Phone',
    'Google',
    'Facebook',
    'Apple',
  ];
  static List<Widget> methodIcons = [
    // Anonymous Icon
    const Icon(
      Icons.person_2_outlined,
      color: AppColors.blackColor,
    ),
    // Phone Icon
    const Icon(
      Icons.phone,
      color: AppColors.blackColor,
    ),
    Assets.icons.googleIcon.image(),
    Assets.icons.facebookIcon.image(),
    Assets.icons.appleIcon.image(),
  ];
  static List<VoidCallback> onTapList = [
    // Anonymous Function
    () => sl<AuthBloc>().add(const AuthEvent.signInAnonymously()),
    // Phone Function
    () async => sl<AppRouter>().pushNamed(RouterPath.phoneAuthView),
    // Google Function
    () {},
    // Facebook Function
    () {},
    // Apple Function
    () {},
  ];
}
