import 'package:flutter/material.dart';
import 'package:simple_chat_app/core/theme/app_colors.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    required this.body,
    super.key,
    this.appBar,
    this.persistentFooterButtons,
    this.bgColor,
  });
  final Widget body;
  final PreferredSizeWidget? appBar;
  final List<Widget>? persistentFooterButtons;
  final Color? bgColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor ?? AppColors.beigeColor,
      appBar: appBar,
      body: body,
      persistentFooterButtons: persistentFooterButtons,
      persistentFooterAlignment: AlignmentDirectional.center,
    );
  }
}
