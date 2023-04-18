import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_chat_app/core/constants/app_content_texts.dart';
import 'package:simple_chat_app/core/dependency_injection/di.dart';
import 'package:simple_chat_app/core/widgets/custom_scaffold.dart';
import 'package:simple_chat_app/core/widgets/home_app_bar.dart';
import 'package:simple_chat_app/feature/home/presentation/bloc/home_bloc.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const HomeAppBar(
        title: AppContentTexts.messages,
      ),
      body: BlocProvider.value(
        value: sl<HomeBloc>()..add(const HomeEvent.getUserModel()),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return const Center(
              child: Text('MessagesView'),
            );
          },
        ),
      ),
    );
  }
}
