import 'package:redux/redux.dart';

class GlobalState {
  User userInfo;

  GlobalState({this.userInfo});
}

GlobalState appReducer(GlobalState state, action) {
  return GlobalState(
      userInfo: UserReducer(state.userInfo, action),
  );
}

final UserReducer = combineReducers<User>([
  TypedReducer<User, UpdateUserAction>(_refresh)
]);

User _refresh(User user, action) {
  user = action.user;
  return user;
}

class UpdateUserAction {
  final User user;

  UpdateUserAction(this.user);
}

class User {
  String name;
  String idNo;

  User({this.name, this.idNo});
}

class ThemeData {
  String data;
}
