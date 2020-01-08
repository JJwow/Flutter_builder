import 'package:fish_redux/fish_redux.dart';

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
  final bus_listState newState = state.clone()..busList = action.payload;
  return newState;
}
