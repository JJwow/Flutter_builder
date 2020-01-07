import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action

//Action定义一种行为，可以携带信息.Action 包含两个字段type和payload；
//推荐写法是在action.dart里定义一个type枚举类和一个ActionCreator类，这样有利于约束payload的类型。

enum LoginAction {openLogin_password, queryUserNameData, }
class LoginActionCreator {
  static Action onOpenLogin_password() {
    return const Action(LoginAction.openLogin_password);
  }
  static Action onQueryUserNameData(String userName) {
    return Action(LoginAction.queryUserNameData, payload: userName);
  }
}
