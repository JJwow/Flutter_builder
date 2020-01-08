import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;
import 'package:flutter_app/component/CustomAlertView.dart';
import 'package:flutter_app/page/module_login/login/view.dart';
import 'action.dart';
import 'state.dart';
import 'package:flutter_app/api/api_login/api_login.dart';
import 'package:flutter/material.dart' hide Action;
Effect<Login_passwordState> buildEffect() {
  return combineEffects(<Object, Effect<Login_passwordState>>{
    Login_passwordAction.login: _onLogin,
    Login_passwordAction.openFunctionPage: _onOpenFunctionPage,
  });
}

void _onLogin(Action action, Context<Login_passwordState> ctx) {
  Api().login(ctx.state.userName, ctx.state.password).then((model) {
    if (model.code == "200"){
      ctx.dispatch(Login_passwordActionCreator.onOpenFunctionPage());
    }
    else{
      showAlertDialog(model.desc, ctx.context);
    }
  });
}

void _onOpenFunctionPage(Action action, Context<Login_passwordState> ctx) {
  Navigator.of(ctx.context).pushNamed('bus_list_page',arguments: null);
}
