import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum Login_passwordAction { login, openFunctionPage }

class Login_passwordActionCreator {
  static Action onLogin() {
    return const Action(Login_passwordAction.login);
  }
  static Action onOpenFunctionPage() {
    return const Action(Login_passwordAction.openFunctionPage);
  }
}
