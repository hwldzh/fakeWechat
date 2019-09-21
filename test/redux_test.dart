import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/material.dart';
import 'package:fake_wechat/bean/redux.dart';


void main() => runApp(MyApp());

final store = new Store<GlobalState>(
    appReducer,
    initialState: new GlobalState(
        userInfo: new User(
            name: 'hello',
            idNo: '2'
        )
    )
);

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
      store: store,
      child: MaterialApp(
        home: MainPage(),
      ),
    );
  }

}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<GlobalState, User>(
      converter: (store) => store.state.userInfo,
      builder: (context, userInfo) {
        return Column(
          children: <Widget>[
            Text(
              userInfo.name,
            ),
            RaisedButton(onPressed: _clickButton())
          ],
        );
      },
    );
  }

  _clickButton() {
    store.dispatch(new UpdateUserAction(User(
      name: 'after update name',
      idNo: "after update idNo"
    )));
  }

}



