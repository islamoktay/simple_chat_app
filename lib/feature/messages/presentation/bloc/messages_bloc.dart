import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_chat_app/core/constants/app_content_texts.dart';
import 'package:simple_chat_app/core/dependency_injection/di.dart';
import 'package:simple_chat_app/core/utils/snack_bar/show_snack_bar.dart';
import 'package:simple_chat_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:simple_chat_app/feature/home/data/model/user_model.dart';
import 'package:simple_chat_app/feature/messages/data/model/content_model.dart';
import 'package:simple_chat_app/feature/messages/domain/repo/messages_repo.dart';

part 'messages_bloc.freezed.dart';
part 'messages_event.dart';
part 'messages_state.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  MessagesBloc(this.messagesRepo) : super(const _Initial()) {
    on<_SendMessage>(_onSendMessage);
  }
  final MessagesRepo messagesRepo;

  final messageController = TextEditingController();

  FutureOr<void> _onSendMessage(
    _SendMessage event,
    Emitter<MessagesState> emit,
  ) async {
    try {
      if (messageController.text.isNotEmpty) {
        await messagesRepo.sendMessage(
          user: event.user,
          contentModel: ContentModel(
            createdAt: DateTime.now(),
            isRead: false,
            text: messageController.text,
            uid: sl<AuthBloc>().state.uid,
          ),
        );
      }
      messageController.clear();
    } catch (e, stackTrace) {
      log(e.toString());
      log(stackTrace.toString());
      customSnackBar(content: AppContentTexts.wentWrong);
    }
  }
}
