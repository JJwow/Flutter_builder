import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/page/module_bus/bus_list/bus_list_item/state.dart';
class bus_listState implements Cloneable<bus_listState> {
  List <bus_list_itemState> bus_list_items;
  @override
  bus_listState clone() {
    return bus_listState()
    ..bus_list_items = bus_list_items;
  }
}

bus_listState initState(Map<String, dynamic> args) {
  bus_listState state = bus_listState();
  state.bus_list_items = new List();
  return state;
}
