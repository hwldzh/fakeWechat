import 'package:fake_wechat/bean/chat_bean.dart';
import 'package:fake_wechat/pages/msg_list.dart';
import 'package:fake_wechat/pages/pay_list.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  ChatBean _chatBean;

  ChatPage(ChatBean chatBean) {
    this._chatBean = chatBean;
  }

  @override
  ChatState createState() {
    return ChatState();
  }
}

class ChatState extends State<ChatPage> {

  @override
  Widget build(BuildContext context) {
    String chatTitle = widget._chatBean.name;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          chatTitle,
        ),
      ),
      body: _getWidgetByType(chatTitle),
    );
  }

  Widget _getWidgetByType(String type) {
    if(type == "微信支付") {
      return PayList();
    } else {
      return MsgList();
    }
  }

}