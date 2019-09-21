import 'package:json_annotation/json_annotation.dart';
import 'package:data_plugin/bmob/table/bmob_object.dart';
part 'chat_bean.g.dart';

@JsonSerializable()
class ChatBean extends BmobObject {
  String name; //消息名称
  @JsonKey(name: 'avatar_url')
  String avatarUrl; //消息的头像
  @JsonKey(name: 'last_msg')
  String lastMsg; //最后一条消息内容
  ChatBean();

  @override
  Map getParams() {
    return toJson();
  }

  //不同的类使用不同的mixin即可
  factory ChatBean.fromJson(Map<String, dynamic> json) => _$ChatBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ChatBeanToJson(this);

}