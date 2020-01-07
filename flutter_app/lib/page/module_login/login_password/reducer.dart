import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<Login_passwordState> buildReducer() {
  return asReducer(
    <Object, Reducer<Login_passwordState>>{
      Login_passwordAction.action: _onAction,
    },
  );
}

Login_passwordState _onAction(Login_passwordState state, Action action) {
  final Login_passwordState newState = state.clone();
  return newState;
}
