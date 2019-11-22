import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum Login_passwordAction { action }

class Login_passwordActionCreator {
  static Action onAction() {
    return const Action(Login_passwordAction.action);
  }
}
