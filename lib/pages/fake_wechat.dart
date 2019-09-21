import 'package:flutter/material.dart';
import 'package:fake_wechat/pages/home_page.dart';
import 'package:fake_wechat/pages/contact_page.dart';
import 'package:fake_wechat/pages/near_me_page.dart';
import 'package:fake_wechat/pages/mine_page.dart';

class FakeWeChat extends StatefulWidget {

  @override
  FakeWeChatState createState() {
    return FakeWeChatState();
  }
}

class FakeWeChatState extends State<FakeWeChat> {
  var _appBarTitles =  const ['微信', '通讯录', '发现', '我'];
  var _currentItemIndex = 0;
  List<BottomNavigationBarItem> _bottomNavigationBarItems;
  List<Widget> _bodyPages;
  List<Widget> _actions;

  @override
  void initState() {
    initBarActions();
    initBodyPage();
    initBottomNavigationBar();
  }
  
  void initBarActions() {
    _actions = <Widget>[
      IconButton(
        icon: Icon(
          Icons.search,
        ),
        onPressed: () {
          //TODO 点击跳转到搜索页面
        },
      ),
      IconButton(
        icon: Icon(
          Icons.add_circle_outline,
        ),
        onPressed: () {
          // TODO 点击弹出更多菜单
        },
      )
    ];
  }

  void initBodyPage() {
    _bodyPages = <Widget>[
      HomePage(), ContactPage(), NearMePage(), MinePage()
    ];
  }

  void initBottomNavigationBar() {
    _bottomNavigationBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          title: Text(
            _appBarTitles[0],
          )
      ),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.contacts,
          ),
          title: Text(
            _appBarTitles[1],
          )
      ),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.near_me,
          ),
          title: Text(
            _appBarTitles[2],
          )
      ),
      BottomNavigationBarItem(
          icon: Icon(
              Icons.person
          ),
          title: Text(
            _appBarTitles[3],
          )
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '微信仿真',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            _appBarTitles[_currentItemIndex]
          ),
          actions: _actions
        ),
        body: IndexedStack(
          index: _currentItemIndex,
          children: _bodyPages
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentItemIndex,
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.blue,
            items: _bottomNavigationBarItems,
            onTap: (index) {
              setState(() {
                _currentItemIndex = index;
              });
            },
        )
      ),
    );
  }

}