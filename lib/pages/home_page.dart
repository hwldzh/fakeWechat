import 'package:flutter/material.dart';
import 'package:fake_wechat/items/chat_item.dart';
import 'package:fake_wechat/bean/chat_bean.dart';
import 'package:fake_wechat/http/http_util.dart';
import 'package:fake_wechat/items/loading_more.dart';
import 'package:fake_wechat/constant/constants.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class HomePage extends StatefulWidget {

  @override
  HomeState createState() {
    return HomeState();
  }
}

class HomeState extends State<HomePage> {
  List listData = List();
  final int _pageLimit = 12; //查询一次数据库返回12条数据
  int _skip = 0;
  int _totalCount = 0;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener((){
      var maxScroll = _scrollController.position.maxScrollExtent;
      var pixels = _scrollController.position.pixels;

      if(maxScroll == pixels && listData.length < _totalCount) {
        setState(() {
          listData.add(Constants.LOADING_MORE);
        });
        getChatData();
      }
    });
    getChatData();
  }

  void getChatData() {
    HttpUtil.queryMulti((chatBeanList, totalCount) {
      if(_totalCount <= 0) {
        _totalCount = totalCount;
      }
      if(chatBeanList != null) {
        setState(() {
          List tmpList = new List();
          if(_skip == 0) {
            listData.clear();
          }
          if(listData.length > 0) {
            var itemData = listData[listData.length - 1];
            if(itemData is String && itemData == Constants.LOADING_MORE) {
              listData.removeLast();
            }
          }
          tmpList.addAll(listData);
          tmpList.addAll(chatBeanList);
          listData = tmpList;
          _skip += _pageLimit;
        });
      }
    }, _pageLimit, _skip);
  }

  Future<Null> _onRefresh() async {
    _skip = 0;
    _totalCount = 0;
    getChatData();
    return null;
  }


  @override
  Widget build(BuildContext context) {
    if(listData == null || listData.length == 0) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return RefreshIndicator(
          child: ListView.builder(
            itemCount: listData.length,
            itemBuilder: (context, index) => buildItem(index),
            controller: _scrollController,
            shrinkWrap: true,
          ),
          onRefresh: _onRefresh
      );
    }
  }

  Widget buildItem(int index) {
    var itemData = listData[index];
    if(itemData is String && itemData == Constants.LOADING_MORE) {
      return LoadingMore();
    }
    return ChatItem(itemData);
  }

}