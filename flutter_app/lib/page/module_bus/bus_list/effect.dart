import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<bus_listState> buildEffect() {
  return combineEffects(<Object, Effect<bus_listState>>{
    bus_listAction.queryBusListData: _onQueryBusListData,
  });
}

void _onQueryBusListData(Action action, Context<bus_listState> ctx) {
}
