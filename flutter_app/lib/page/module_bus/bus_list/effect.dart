import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/page/module_bus/bus_list/bus_list_item/state.dart';
import 'action.dart';
import 'state.dart';
import 'package:flutter_app/api/api_bus/api_bus_list.dart';
import 'package:flutter_app/apiModel/apiModel_bus/scheduleList.dart';

Effect<bus_listState> buildEffect() {
  return combineEffects(<Object, Effect<bus_listState>>{
    bus_listAction.queryBusListData: _onQueryBusListData,
  });
}

void _onQueryBusListData(Action action, Context<bus_listState> ctx) {
  Api().getBusListData().then((List<ScheduleList> list){
    List<bus_list_itemState> adapterList = [];
    for (ScheduleList schedule in list){
      bus_list_itemState itemState = bus_list_itemState();
      itemState.schedule = schedule;
      adapterList.add(itemState);
    }
    ctx.dispatch(bus_listActionCreator.onUpdateList(adapterList));
  });
}
