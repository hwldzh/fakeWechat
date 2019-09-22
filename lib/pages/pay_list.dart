import 'package:fake_wechat/bean/wechat_pay.dart';
import 'package:fake_wechat/http/http_util.dart';
import 'package:flutter/material.dart';

class PayList extends StatefulWidget {
  @override
  PayListState createState() {
    return PayListState();
  }
}

class PayListState extends State<PayList> {
  List _messageList = new List();

  @override
  Widget build(BuildContext context) {
    if(_messageList == null || _messageList.length == 0) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: _getPayDetailCard(index),
          );
        },
        itemCount: _messageList.length,
      );
    }
  }

  Widget _getPayDetailCard(int index) {
    WeChatPay weChatPay = _messageList[index];
    return Column(
      children: <Widget>[
        SizedBox(
          height: 40.0,
          child: Center(
            child: Text(
              weChatPay.createdAt,
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            weChatPay.businessName,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Center(
                          child: Text(
                              "付款金额"
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          weChatPay.payMoney,
                          style: TextStyle(
                              fontSize: 30
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 10),
                        child: Divider(
                          height: 0.5,
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                                "查看账单详情"
                            ),
                          ),
                          Icon(
                              Icons.keyboard_arrow_right
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            )
          ],
        )
//        SizedBox(
//          height: 200.0,
//          child: Row(
//            children: <Widget>[],
//          )
//        )
      ],
    );

  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() {
    HttpUtil.queryMultiWeChatPay((List<WeChatPay> wechatPayList) {
      if(wechatPayList != null) {
        setState(() {
          _messageList.clear();
          _messageList.addAll(wechatPayList);
        });
      }
    });
  }

}