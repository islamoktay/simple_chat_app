import 'package:simple_chat_app/feature/home/data/model/user_model.dart';
import 'package:simple_chat_app/feature/messages/data/model/content_model.dart';

abstract class MessagesRepo {
  Future<void> sendMessage({
    required UserModel user,
    required ContentModel contentModel,
  });
  Future<void> createMessageDB();
  Future<void> deleteMessageDB();
}
