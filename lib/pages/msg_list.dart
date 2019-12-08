import 'package:flutter/material.dart';

class MsgList extends StatefulWidget {
  @override
  MsgListState createState() {
    return MsgListState();
  }
}

class MsgListState extends State<MsgList> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "聊天内容"
      ),
    );
  }

}