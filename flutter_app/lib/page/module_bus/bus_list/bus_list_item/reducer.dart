import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<bus_list_itemState> buildReducer() {
  return asReducer(
    <Object, Reducer<bus_list_itemState>>{
      bus_list_itemAction.action: _onAction,
    },
  );
}

bus_list_itemState _onAction(bus_list_itemState state, Action action) {
  final bus_list_itemState newState = state.clone();
  return newState;
}
