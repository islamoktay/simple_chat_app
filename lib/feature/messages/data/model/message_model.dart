import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_chat_app/feature/home/data/model/user_model.dart';
import 'package:simple_chat_app/feature/messages/data/model/content_model.dart';
part 'message_model.freezed.dart';
part 'message_model.g.dart';

@unfreezed
class MessageModel with _$MessageModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  factory MessageModel({
    UserModel? fromWho,
    List<ContentModel>? contents,
  }) = _MessageModel;
  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
}
