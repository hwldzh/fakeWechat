// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatBean _$ChatBeanFromJson(Map<String, dynamic> json) {
  return ChatBean()
    ..createdAt = json['createdAt'] as String
    ..updatedAt = json['updatedAt'] as String
    ..objectId = json['objectId'] as String
    ..ACL = json['ACL'] as Map<String, dynamic>
    ..name = json['name'] as String
    ..avatarUrl = json['avatar_url'] as String
    ..lastMsg = json['last_msg'] as String;
}

Map<String, dynamic> _$ChatBeanToJson(ChatBean instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'objectId': instance.objectId,
      'ACL': instance.ACL,
      'name': instance.name,
      'avatar_url': instance.avatarUrl,
      'last_msg': instance.lastMsg
    };
