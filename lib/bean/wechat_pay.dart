import 'package:data_plugin/bmob/table/bmob_object.dart';
import 'package:json_annotation/json_annotation.dart';
part 'wechat_pay.g.dart';

@JsonSerializable()
class WeChatPay extends BmobObject {
  @JsonKey(name: 'bus_name')
  String businessName;
  @JsonKey(name: 'pay_money')
  String payMoney;

  WeChatPay();

  @override
  Map getParams() {
    return toJson();
  }

  //不同的类使用不同的mixin即可
  factory WeChatPay.fromJson(Map<String, dynamic> json) => _$WeChatPayFromJson(json);

  Map<String, dynamic> toJson() => _$WeChatPayToJson(this);
}