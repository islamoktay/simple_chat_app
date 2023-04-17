import 'package:flutter/material.dart';
import 'package:simple_chat_app/core/widgets/custom_scaffold.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: Center(
        child: Text('MessagesView'),
      ),
    );
  }
}
