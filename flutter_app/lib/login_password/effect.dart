import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<Login_passwordState> buildEffect() {
  return combineEffects(<Object, Effect<Login_passwordState>>{
    Login_passwordAction.action: _onAction,
  });
}

void _onAction(Action action, Context<Login_passwordState> ctx) {
}
