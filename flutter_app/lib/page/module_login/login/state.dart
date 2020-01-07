import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/apiModel/apiModel_login/queryLoginModel.dart';
class LoginState implements Cloneable<LoginState> {
  QueryLoginModel model;
  @override
  LoginState clone() {
    return LoginState();
  }
}

LoginState initState(Map<String, dynamic> args) {
  return LoginState();
}
