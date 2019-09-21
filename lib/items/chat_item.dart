import 'package:flutter/material.dart';
import 'package:fake_wechat/bean/chat_bean.dart';

class ChatItem extends StatefulWidget {
  ChatBean _chatBean;

  ChatItem(ChatBean chatBean) {
    _chatBean = chatBean;
  }

  @override
  ChatItemState createState() {
    return ChatItemState();
  }

}

class ChatItemState extends State<ChatItem> {

  @override
  Widget build(BuildContext context) {

    Row _row = Row(
      children: <Widget>[
        Image.network(
          widget._chatBean.avatarUrl,
          width: 50,
          height: 50,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        widget._chatBean.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16
                        ),
                      ),
                    ),
                    Text(
                      widget._chatBean.createdAt,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Text(
                  widget._chatBean.lastMsg,
                  softWrap: false,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14
                  ),
                ),
              ],
            ),
          )
        ),
      ],
    );

    Column column = new Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
          child: _row,
        ),
        Divider(
          height: 0.5,
          color: Colors.grey,
        )
      ],
    );

    return Container(
      child: column,
    );
  }

}