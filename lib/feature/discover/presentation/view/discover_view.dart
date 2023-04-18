import 'package:flutter/material.dart';
import 'package:simple_chat_app/core/constants/app_content_texts.dart';
import 'package:simple_chat_app/core/widgets/custom_scaffold.dart';
import 'package:simple_chat_app/core/widgets/home_app_bar.dart';

class DiscoverView extends StatelessWidget {
  const DiscoverView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      appBar: HomeAppBar(
        title: AppContentTexts.discover,
      ),
      body: Center(
        child: Text('DiscoverView'),
      ),
    );
  }
}
