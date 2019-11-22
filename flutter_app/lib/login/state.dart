import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/model/queryLoginModel.dart';
class LoginState implements Cloneable<LoginState> {
  QueryLoginModel model;
  @override
  LoginState clone() {
    return LoginState();
    model = model;
  }
}

LoginState initState(Map<String, dynamic> args) {
  return LoginState();
}
