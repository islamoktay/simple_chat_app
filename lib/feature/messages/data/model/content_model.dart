import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_chat_app/core/utils/json_converter/timestamp_converter.dart';

part 'content_model.freezed.dart';
part 'content_model.g.dart';

@unfreezed
class ContentModel with _$ContentModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  factory ContentModel({
    bool? isRead,
    String? uid,
    String? text,
    @TimestampConverter() DateTime? createdAt,
  }) = _ContentModel;
  factory ContentModel.fromJson(Map<String, dynamic> json) =>
      _$ContentModelFromJson(json);
}
