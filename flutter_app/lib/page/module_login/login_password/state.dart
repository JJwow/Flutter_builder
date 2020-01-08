import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/page/module_login/login/view.dart';

class Login_passwordState implements Cloneable<Login_passwordState> {
  Login_passwordState({this.userName, this.password});
  String userName, password;

  @override
  Login_passwordState clone() {
    return Login_passwordState();
  }
}

Login_passwordState initState(Map<String, dynamic> args) {
  Login_passwordState state = Login_passwordState();
  state.userName = args["userName"];
  return state;
}
