import 'package:data_plugin/bmob/bmob_query.dart';
import 'package:fake_wechat/bean/chat_bean.dart';
import 'package:fake_wechat/bean/wechat_pay.dart';

class HttpUtil {

  ///查询多条聊天数据
  static void queryMultiChatBean(Function callback, int pageLimit, int skipCount) async {
    BmobQuery<ChatBean> query = BmobQuery();
    query.setLimit(pageLimit);
    query.setSkip(skipCount);
    List<dynamic> data = await query.queryObjects();
    int totalCount = await query.queryCount();
    List<ChatBean> chatBeans = data.map((i) => ChatBean.fromJson(i)).toList();
    callback(chatBeans, totalCount);
  }

  ///查询多条微信支付数据
  static void queryMultiWeChatPay(Function callback) async {
    BmobQuery<WeChatPay> query = new BmobQuery();
    List<dynamic> data = await query.queryObjects();
    List<WeChatPay> wechatPays = data.map((i) => WeChatPay.fromJson(i)).toList();
    callback(wechatPays);
  }

}