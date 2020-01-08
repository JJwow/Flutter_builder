import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/apiModel/apiModel_bus/scheduleList.dart';
class bus_listState implements Cloneable<bus_listState> {
  bus_listState({this.busList});
  List <ScheduleList> busList;
  @override
  bus_listState clone() {
    return bus_listState();
  }
}

bus_listState initState(Map<String, dynamic> args) {
  bus_listState state = bus_listState();
  state.busList = new List();
  return state;
}
