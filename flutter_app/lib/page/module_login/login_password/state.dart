import 'package:fish_redux/fish_redux.dart';

class Login_passwordState implements Cloneable<Login_passwordState> {

  @override
  Login_passwordState clone() {
    return Login_passwordState();
  }
}

Login_passwordState initState(Map<String, dynamic> args) {
  return Login_passwordState();
}
