import 'package:flutter/material.dart';
import 'package:fake_wechat/pages/fake_wechat.dart';
import 'package:data_plugin/bmob/bmob.dart';

void main() => runApp(MyApp());

/// MyApp是一个Widget，返回FakeWeChat，FakeWeChat也是一个Widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Bmob.initMasterKey("f01bdb6b455ae38020a5e17cff047ab4", "ce4acc11e0fb60405d83e23d11e9de51", "d5a07d0da1df423c3381b8b904f57e57");
    return FakeWeChat();
  }

}
