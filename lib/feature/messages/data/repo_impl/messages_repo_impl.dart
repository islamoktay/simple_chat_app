import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:simple_chat_app/core/dependency_injection/di.dart';
import 'package:simple_chat_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:simple_chat_app/feature/home/data/model/user_model.dart';
import 'package:simple_chat_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:simple_chat_app/feature/messages/data/model/content_model.dart';
import 'package:simple_chat_app/feature/messages/data/model/message_model.dart';
import 'package:simple_chat_app/feature/messages/domain/repo/messages_repo.dart';

class MessagesRepoImpl implements MessagesRepo {
  @override
  Future<void> sendMessage({
    required UserModel user,
    required ContentModel contentModel,
  }) async {
    await addMessage(
      senderUid: user.uid ?? '',
      receiverUid: sl<AuthBloc>().state.uid ?? '',
      senderModel: user,
      receiverModel: sl<HomeBloc>().state.userModel ?? UserModel(),
      content: contentModel,
    );
    await addMessage(
      senderUid: sl<AuthBloc>().state.uid ?? '',
      receiverUid: user.uid ?? '',
      senderModel: sl<HomeBloc>().state.userModel ?? UserModel(),
      receiverModel: user,
      content: contentModel.copyWith(isRead: true),
    );
    if (Platform.isAndroid) {
      await sendNotification(
        fcmToken: user.fcmToken ?? '',
        content: contentModel.text ?? '',
        title: user.name ?? '',
        uid: contentModel.uid ?? '',
      );
    }
  }

  Future<void> sendNotification({
    required String fcmToken,
    required String title,
    required String content,
    required String uid,
  }) async {
    await FirebaseMessaging.instance.sendMessage(
      to: fcmToken,
      data: {
        'title': title,
        'content': content,
        'payload': uid,
      },
    );
  }

  @override
  Future<void> createMessageDB() async {
    await FirebaseFirestore.instance
        .collection('messages')
        .doc(sl<AuthBloc>().state.uid)
        .set(
      {
        'messages': <MessageModel>[],
      },
    );
  }

  @override
  Future<void> deleteMessageDB() async {
    await FirebaseFirestore.instance
        .collection('messages')
        .doc(sl<AuthBloc>().state.uid)
        .delete();
  }

  Future<void> addMessage({
    required String senderUid,
    required String receiverUid,
    required UserModel senderModel,
    required UserModel receiverModel,
    required ContentModel content,
  }) async {
    final response =
        FirebaseFirestore.instance.collection('messages').doc(senderUid);
    final responseDoc = await response.get();
    final messageList = <MessageModel>[];
    if (responseDoc.exists) {
      final data = responseDoc.data();
      for (final element in data?['messages'] as List? ?? []) {
        final messageModel =
            MessageModel.fromJson(element as Map<String, dynamic>);
        messageList.add(messageModel);
      }
    }
    final chosenMessage = messageList.firstWhere(
      (element) => element.fromWho?.uid == receiverUid,
      orElse: MessageModel.new,
    );

    if (chosenMessage.fromWho != null) {
      final list = <ContentModel>[...chosenMessage.contents ?? [], content];
      chosenMessage.contents = list;
      await FirebaseFirestore.instance
          .collection('messages')
          .doc(senderUid)
          .update({'messages': messageList.map((e) => e.toJson())});
    } else {
      await FirebaseFirestore.instance
          .collection('messages')
          .doc(senderUid)
          .update(
        {
          'messages': FieldValue.arrayUnion(
            [
              MessageModel(
                fromWho: receiverModel,
                contents: [content],
              ).toJson(),
            ],
          ),
        },
      );
    }
  }

  @override
  Future<void> markAsReadMessages({required String uid}) async {
    final response = FirebaseFirestore.instance
        .collection('messages')
        .doc(sl<AuthBloc>().state.uid);
    final responseDoc = await response.get();
    final messageList = <MessageModel>[];
    if (responseDoc.exists) {
      final data = responseDoc.data();
      for (final element in data?['messages'] as List? ?? []) {
        final messageModel =
            MessageModel.fromJson(element as Map<String, dynamic>);
        messageList.add(messageModel);
      }
    }
    final chosenMessage =
        messageList.firstWhere((element) => element.fromWho?.uid == uid);
    chosenMessage.contents?.forEach((e) => e.isRead = true);
    await FirebaseFirestore.instance
        .collection('messages')
        .doc(sl<AuthBloc>().state.uid)
        .update({'messages': messageList.map((e) => e.toJson())});
  }
}
