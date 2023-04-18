// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      name: json['name'] as String?,
      photoUrl: json['photo_url'] as String?,
      fcmToken: json['fcm_token'] as String?,
      uid: json['uid'] as String?,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'photo_url': instance.photoUrl,
      'fcm_token': instance.fcmToken,
      'uid': instance.uid,
    };
