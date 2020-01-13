import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/page/module_bus/bus_list/bus_list_item/state.dart';

import 'action.dart';
import 'state.dart';

Reducer<bus_listState> buildReducer() {
  return asReducer(
    <Object, Reducer<bus_listState>>{
      bus_listAction.updateList: _onUpdateList,
    },
  );
}

bus_listState _onUpdateList(bus_listState state, Action action) {
  final List<bus_list_itemState> data = action.payload ?? <bus_list_itemState>[];
  final bus_listState newState = state.clone()..bus_list_items = data;
  return newState;
}
