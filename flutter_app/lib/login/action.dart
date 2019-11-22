import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum LoginAction { action, openLogin_password, queryUserNameData }

class LoginActionCreator {
  static Action onAction() {
    return const Action(LoginAction.action);
  }
  static Action onOpenLogin_password() {
    return const Action(LoginAction.openLogin_password);
  }
  static Action onQueryUserNameData() {
    return const Action(LoginAction.queryUserNameData);
  }
}
