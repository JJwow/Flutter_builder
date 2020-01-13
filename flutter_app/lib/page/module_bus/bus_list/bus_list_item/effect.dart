import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<bus_list_itemState> buildEffect() {
  return combineEffects(<Object, Effect<bus_list_itemState>>{
    bus_list_itemAction.action: _onAction,
  });
}

void _onAction(Action action, Context<bus_list_itemState> ctx) {
}
