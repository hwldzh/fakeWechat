import 'package:data_plugin/bmob/bmob_query.dart';
import 'package:fake_wechat/bean/chat_bean.dart';

class HttpUtil {

  ///查询多条数据
  static void queryMulti(Function callback, int pageLimit, int skipCount) async {
    BmobQuery<ChatBean> query = BmobQuery();
    query.setLimit(pageLimit);
    query.setSkip(skipCount);
    List<dynamic> data = await query.queryObjects();
    int totalCount = await query.queryCount();
    List<ChatBean> chatBeans = data.map((i) => ChatBean.fromJson(i)).toList();
    callback(chatBeans, totalCount);
  }

}