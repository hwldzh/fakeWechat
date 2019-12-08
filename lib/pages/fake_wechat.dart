import 'package:fake_wechat/pages/search_page.dart';
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '微信仿真',
      theme: ThemeData( // App的主题
        primaryColor: Colors.blue,
      ),
      home: AppPage(),
    );
  }

}
/// FakeWeChat是一个有状态的Widget，可以看到FakeWeChatState的build方法返回MaterialApp的Widget对象
class AppPage extends StatefulWidget {

  @override
  AppPageState createState() {
    return AppPageState();
  }
}

class AppPageState extends State<AppPage> {
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
        onPressed: () { //如果去掉这个属性，IconButton默认是不可点击的，则这个时候它会显示为灰色
          //TODO 点击跳转到搜索页面
          Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => new SearchPage()));
        },
      ),
      IconButton(
        icon: Icon(
          Icons.add_circle_outline,
        ),
        onPressed: () { //如果去掉这个属性，IconButton默认是不可点击的，则这个时候它会显示为灰色
          // TODO 点击弹出更多菜单
        },
      ),
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
    return Scaffold( // 就像是一个页面模板，里面包含了App标题栏、App内容、App底部栏等内容，我们可以随意组装
        appBar: AppBar( //App的标题栏
            title: Text( //标题
                _appBarTitles[_currentItemIndex]
            ),
            actions: _actions //
        ),
        body: IndexedStack( //App的内容
            index: _currentItemIndex,
            children: _bodyPages
        ),
        bottomNavigationBar: BottomNavigationBar( //App的底部栏
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
    );
  }
}