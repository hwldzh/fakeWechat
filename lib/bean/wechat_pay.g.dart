// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wechat_pay.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeChatPay _$WeChatPayFromJson(Map<String, dynamic> json) {
  return WeChatPay()
    ..createdAt = json['createdAt'] as String
    ..updatedAt = json['updatedAt'] as String
    ..objectId = json['objectId'] as String
    ..ACL = json['ACL'] as Map<String, dynamic>
    ..businessName = json['bus_name'] as String
    ..payMoney = json['pay_money'] as String;
}

Map<String, dynamic> _$WeChatPayToJson(WeChatPay instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'objectId': instance.objectId,
      'ACL': instance.ACL,
      'bus_name': instance.businessName,
      'pay_money': instance.payMoney
    };
