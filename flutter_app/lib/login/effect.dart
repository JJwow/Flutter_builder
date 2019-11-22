import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<LoginState> buildEffect() {
  return combineEffects(<Object, Effect<LoginState>>{
    LoginAction.action: _onAction,
    LoginAction.openLogin_password:_openLogin_password,
  });
}

void _onAction(Action action, Context<LoginState> ctx) {
}

void _openLogin_password(Action action, Context<LoginState> ctx) {
  Navigator.of(ctx.context).pushNamed('login_password_page', arguments: null);    //注意2
}

void _init(Action action, Context<LoginState> ctx) {
  ctx.dispatch(LoginActionCreator.onQueryUserNameData()); //发送事件
}
