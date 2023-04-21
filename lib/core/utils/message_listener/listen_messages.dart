import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simple_chat_app/core/dependency_injection/di.dart';
import 'package:simple_chat_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:simple_chat_app/feature/messages/data/model/content_model.dart';
import 'package:simple_chat_app/feature/messages/data/model/message_model.dart';

class ListenMessages {
  static Stream<List<MessageModel>> getMessages() {
    try {
      final response = FirebaseFirestore.instance
          .collection('messages')
          .doc(sl<AuthBloc>().state.uid);
      final responseDoc = response.snapshots().transform(
        StreamTransformer<DocumentSnapshot<Map<String, dynamic>>,
            List<MessageModel>>.fromHandlers(
          handleData: (data, sink) {
            final snaps = data.data();
            final resultList = <MessageModel>[];
            if (snaps != null) {
              final list = snaps['messages'] as List;
              for (final element in list) {
                resultList.add(
                  MessageModel.fromJson(
                    element as Map<String, dynamic>,
                  ),
                );
              }
              sink.add(resultList);
            }
          },
        ),
      );
      return responseDoc;
    } catch (e, stackTrace) {
      log(e.toString());
      log(stackTrace.toString());
      throw Exception(e);
    }
  }

  static Stream<List<ContentModel>> getUserMessage({required String uid}) {
    try {
      final response = FirebaseFirestore.instance
          .collection('messages')
          .doc(sl<AuthBloc>().state.uid);
      final responseDoc = response.snapshots().transform(
        StreamTransformer<DocumentSnapshot<Map<String, dynamic>>,
            List<ContentModel>>.fromHandlers(
          handleData: (data, sink) {
            final snaps = data.data();
            final resultList = <MessageModel>[];
            if (snaps != null) {
              final list = snaps['messages'] as List;
              for (final element in list) {
                resultList.add(
                  MessageModel.fromJson(
                    element as Map<String, dynamic>,
                  ),
                );
              }

              final contentList = resultList
                  .firstWhere((element) => element.fromWho?.uid == uid);

              sink.add(contentList.contents ?? []);
            }
          },
        ),
      );
      return responseDoc;
    } catch (e, stackTrace) {
      log(e.toString());
      log(stackTrace.toString());
      throw Exception(e);
    }
  }
}
