import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';
import '../../../api/api_login/api_login.dart';
import 'package:flutter_app/component/CustomAlertView.dart';

Effect<LoginState> buildEffect() {
  return combineEffects(<Object, Effect<LoginState>>{
    LoginAction.openLogin_password:_openLogin_password,
    LoginAction.queryUserNameData:_queryUserNameData,
  });
}

void _openLogin_password(Action action, Context<LoginState> ctx) {
  ctx.state.userName = action.payload;
  Navigator.of(ctx.context).pushNamed('login_password_page', arguments: {"userName":action.payload});    //注意2
}

void _queryUserNameData(Action action, Context<LoginState> ctx){
  Api().getUser(action.payload).then((model){
    if (model.code == "200") {
      ctx.dispatch(LoginActionCreator.onOpenLogin_password(action.payload));
    }
    else{
      showAlertDialog(model.desc,ctx.context);
    }
  });
}

