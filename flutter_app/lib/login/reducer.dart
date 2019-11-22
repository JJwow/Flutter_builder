import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';
import 'api.dart';

Reducer<LoginState> buildReducer() {
  return asReducer(
    <Object, Reducer<LoginState>>{
      LoginAction.action: _onAction,
      LoginAction.queryUserNameData:_onQueryUserNameData,
    },
  );
}

LoginState _onAction(LoginState state, Action action) {
  final LoginState newState = state.clone();
  return newState;
}

//初始化数据
LoginState _onQueryUserNameData(LoginState state, Action action) {
  final future = Api().getUser();
//  future.then((status) => pushTo(status,context));
  final LoginState newState = state.clone().model = Api().getUser();//从Api请求数据
  return newState;
}
