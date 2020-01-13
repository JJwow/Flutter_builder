import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/apiModel/apiModel_bus/scheduleList.dart';
class bus_list_itemState implements Cloneable<bus_list_itemState> {
  ScheduleList schedule;
  bus_list_itemState({this.schedule});
  @override
  bus_list_itemState clone() {
    return bus_list_itemState()
    ..schedule = schedule;
  }
}

bus_list_itemState initState(Map<String, dynamic> args) {
  return bus_list_itemState();
}
