import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/model/queryLoginModel.dart';
class LoginState implements Cloneable<LoginState> {
  String userName;
  QueryLoginModel model;
  @override
  LoginState clone() {
    return LoginState();
  }
}

LoginState initState(Map<String, dynamic> args) {
  return LoginState();
}
